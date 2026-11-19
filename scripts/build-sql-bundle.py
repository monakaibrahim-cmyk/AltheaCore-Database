import glob
import os
import re
import sys

DB_MAPPINGS = [
    ("DNGSM", "dngsm"),
    ("DNMembersip", "dnmembership"),
    ("DNServerLog", "dnserverlog"),
    ("DNStaging", "dnstaging"),
    ("DNWorld", "dnworld"),
]

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
MSSQL_DIR = os.path.dirname(SCRIPT_DIR)
PARENT_DIR = os.path.dirname(MSSQL_DIR)
_default_db = os.path.join(PARENT_DIR, "Database")
if not os.path.isdir(_default_db):
    _default_db = os.path.join(os.path.dirname(PARENT_DIR), "Database")
SRC_DB_ROOT = os.environ.get("SRC_DB_ROOT", _default_db)
OUT_SQL_DIR = os.environ.get("OUT_SQL_DIR", os.path.join(MSSQL_DIR, "sql"))


def read_sql_utf8(path: str) -> str:
    with open(path, "rb") as f:
        raw = f.read()
    text = raw.decode("utf-8-sig")
    return text.replace("\r\n", "\n").replace("\r", "\n").strip() + "\n"


def split_batches(text: str):
    return [b for b in re.split(r"(?im)^\s*GO\s*$", text) if b.strip()]


def is_fk_batch(batch: str) -> bool:
    return bool(
        re.search(r"\bFOREIGN\s+KEY\b", batch, re.I)
        or re.search(r"\b(?:WITH\s+(?:CHECK|NOCHECK)\s+)?(?:CHECK|NOCHECK)\s+CONSTRAINT\b", batch, re.I)
    )


def strip_leading_use(batches):
    if batches and re.match(r"^\s*USE\s+\[[^\]]+\]\s*$", batches[0], re.I):
        return batches[1:]
    return batches


def wrap_db_create(db_name: str, text: str) -> str:
    # Make database creation scripts idempotent on existing databases.
    lines = []
    batches = split_batches(text)
    for b in batches:
        if re.match(r"^\s*USE\s+\[master\]\s*$", b, re.I):
            lines.append(b.strip())
            lines.append("GO")
        elif re.search(r"\bCREATE\s+DATABASE\b", b, re.I):
            if re.search(r"IF\s+NOT\s+EXISTS\s*\(\s*SELECT\s+name\s+FROM\s+sys\.databases", b, re.I):
                lines.append(b.strip())
                lines.append("GO")
            else:
                escaped = b.strip().replace("'", "''")
                lines.append(
                    f"IF DB_ID(N'{db_name}') IS NULL\nBEGIN\nEXEC sp_executesql N'{escaped}';\nEND\nGO"
                )
        else:
            lines.append(b.strip())
            lines.append("GO")
    return "\n".join(lines) + "\n"


def write_sql(filename: str, parts):
    os.makedirs(OUT_SQL_DIR, exist_ok=True)
    out_path = os.path.join(OUT_SQL_DIR, filename)
    with open(out_path, "w", encoding="utf-8", newline="\n") as f:
        for part in parts:
            if not part.strip():
                continue
            f.write(part.rstrip() + "\n")


def main():
    p01_databases = ["SET NOCOUNT ON;\nGO\n"]
    p02_principals = ["SET NOCOUNT ON;\nGO\n"]
    p03_tables = ["SET NOCOUNT ON;\nGO\n"]
    p04_fks = ["SET NOCOUNT ON;\nGO\n"]
    p05_functions = ["SET NOCOUNT ON;\nGO\n"]
    p06_views = ["SET NOCOUNT ON;\nGO\n"]
    p07_triggers = ["SET NOCOUNT ON;\nGO\n"]
    p08_procedures = ["SET NOCOUNT ON;\nGO\n"]

    for folder, dbname in DB_MAPPINGS:
        db_path = os.path.join(SRC_DB_ROOT, folder)
        if not os.path.isdir(db_path):
            print(f"ERROR: missing database directory: {db_path}", file=sys.stderr)
            sys.exit(1)

        # 01 Databases
        for f in sorted(glob.glob(os.path.join(db_path, "*.Database.sql"))):
            p01_databases.append(wrap_db_create(dbname, read_sql_utf8(f)))

        # 02 Principals (Roles + Users + SPExecutor db_owner)
        for f in sorted(glob.glob(os.path.join(db_path, "*.Role.sql"))):
            p02_principals.append(read_sql_utf8(f))
        for f in sorted(glob.glob(os.path.join(db_path, "*.User.sql"))):
            p02_principals.append(read_sql_utf8(f))
        p02_principals.append(
            f"USE [{dbname}]\nGO\n"
            f"IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')\n"
            f"    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];\nGO\n"
        )

        # 03 Tables (non-FK batches) and 04 Foreign Keys
        p03_tables.append(
            f"USE [{dbname}]\nGO\n"
            "SET ANSI_NULLS ON\nGO\n"
            "SET QUOTED_IDENTIFIER ON\nGO\n"
            "SET ANSI_PADDING ON\nGO\n"
            "SET ANSI_WARNINGS ON\nGO\n"
            "SET CONCAT_NULL_YIELDS_NULL ON\nGO\n"
            "SET ARITHABORT ON\nGO\n"
            "SET NUMERIC_ROUNDABORT OFF\nGO\n"
        )
        fk_batches_for_db = []
        table_files = sorted(glob.glob(os.path.join(db_path, "*.Table.sql")))
        has_tally = any(os.path.basename(f).lower() == "dbo.tally.table.sql" for f in table_files)
        if not has_tally:
            p03_tables.append(
                "IF OBJECT_ID(N'[dbo].[Tally]', N'U') IS NULL\nBEGIN\n"
                "    CREATE TABLE [dbo].[Tally]([n] [int] IDENTITY(1,1) NOT NULL, CONSTRAINT [PK_Tally] PRIMARY KEY CLUSTERED ([n] ASC) ON [PRIMARY]) ON [PRIMARY];\n"
                "    SET IDENTITY_INSERT [dbo].[Tally] ON;\n"
                "    WITH E1(N) AS (SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),\n"
                "         E2(N) AS (SELECT 1 FROM E1 a, E1 b),\n"
                "         E4(N) AS (SELECT 1 FROM E2 a, E2 b)\n"
                "    INSERT INTO [dbo].[Tally]([n]) SELECT TOP (10000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM E4;\n"
                "    SET IDENTITY_INSERT [dbo].[Tally] OFF;\n"
                "END\nGO\n"
            )
        for f in table_files:
            raw_txt = read_sql_utf8(f)
            batches = strip_leading_use(split_batches(raw_txt))
            non_fk = []
            for b in batches:
                if is_fk_batch(b):
                    fk_batches_for_db.append(b.strip() + "\nGO")
                else:
                    stmt = b.strip()
                    if stmt.count("\nINSERT ") >= 5 or stmt.count("\nINSERT\t") >= 5:
                        stmt = "BEGIN TRANSACTION;\n" + stmt + "\nCOMMIT TRANSACTION;"
                    non_fk.append(stmt + "\nGO")
            if non_fk:
                p03_tables.append("\n".join(non_fk) + "\n")
                if re.search(r"(?im)SET\s+(?:ANSI_NULLS|QUOTED_IDENTIFIER|ANSI_PADDING|ANSI_WARNINGS|CONCAT_NULL_YIELDS_NULL)\s+OFF\b", raw_txt):
                    p03_tables.append(
                        "SET ANSI_NULLS ON\nGO\nSET QUOTED_IDENTIFIER ON\nGO\n"
                        "SET ANSI_PADDING ON\nGO\nSET ANSI_WARNINGS ON\nGO\n"
                        "SET CONCAT_NULL_YIELDS_NULL ON\nGO\n"
                    )

        if fk_batches_for_db:
            p04_fks.append(f"USE [{dbname}]\nGO\n" + "\n".join(fk_batches_for_db) + "\n")

        # 05 Functions
        for f in sorted(glob.glob(os.path.join(db_path, "*.UserDefinedFunction.sql"))):
            p05_functions.append(read_sql_utf8(f))

        # 06 Views
        for f in sorted(glob.glob(os.path.join(db_path, "*.View.sql"))):
            p06_views.append(read_sql_utf8(f))

        # 07 DDL Triggers
        for f in sorted(glob.glob(os.path.join(db_path, "*.DdlTrigger.sql"))):
            p07_triggers.append(read_sql_utf8(f))

        # 08 Stored Procedures
        for f in sorted(glob.glob(os.path.join(db_path, "*.StoredProcedure.sql"))):
            p08_procedures.append(read_sql_utf8(f))

    # 09 Post-setup: login + database users + roles (parameterized via sqlcmd -v)
    p09_post = [
        """USE [master]
GO
DECLARE @AppUser sysname = N'$(DN_APP_USER)';
DECLARE @AppPass nvarchar(256) = N'$(DN_APP_PASSWORD)';
DECLARE @Sql nvarchar(max);

IF NOT EXISTS (SELECT 1 FROM sys.sql_logins WHERE name = @AppUser)
BEGIN
    SET @Sql = N'CREATE LOGIN ' + QUOTENAME(@AppUser)
        + N' WITH PASSWORD = N''' + REPLACE(@AppPass, N'''', N'''''')
        + N''', DEFAULT_DATABASE = [dnworld], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;';
    EXEC sp_executesql @Sql;
END
ELSE
BEGIN
    SET @Sql = N'ALTER LOGIN ' + QUOTENAME(@AppUser)
        + N' WITH PASSWORD = N''' + REPLACE(@AppPass, N'''', N'''''')
        + N''', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;';
    EXEC sp_executesql @Sql;
END
GO
"""
    ]
    for _, dbname in DB_MAPPINGS:
        p09_post.append(
            f"""USE [{dbname}]
GO
DECLARE @AppUser sysname = N'$(DN_APP_USER)';
DECLARE @Sql nvarchar(max);

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = @AppUser)
BEGIN
    SET @Sql = N'CREATE USER ' + QUOTENAME(@AppUser) + N' FOR LOGIN ' + QUOTENAME(@AppUser) + N' WITH DEFAULT_SCHEMA = [dbo];';
    EXEC sp_executesql @Sql;
END
ELSE
BEGIN
    SET @Sql = N'ALTER USER ' + QUOTENAME(@AppUser) + N' WITH LOGIN = ' + QUOTENAME(@AppUser) + N';';
    EXEC sp_executesql @Sql;
END

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'AppServer' AND type = 'R')
BEGIN
    SET @Sql = N'ALTER ROLE [AppServer] ADD MEMBER ' + QUOTENAME(@AppUser) + N';';
    EXEC sp_executesql @Sql;
END

SET @Sql = N'ALTER ROLE [db_owner] ADD MEMBER ' + QUOTENAME(@AppUser) + N';';
EXEC sp_executesql @Sql;

IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')
    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];
GO
"""
        )

    write_sql("01_databases.sql", p01_databases)
    write_sql("02_principals.sql", p02_principals)
    write_sql("03_tables.sql", p03_tables)
    write_sql("04_foreign_keys.sql", p04_fks)
    write_sql("05_functions.sql", p05_functions)
    write_sql("06_views.sql", p06_views)
    write_sql("07_triggers.sql", p07_triggers)
    write_sql("08_procedures.sql", p08_procedures)
    write_sql("09_post_setup.sql", p09_post)

    print(f"Generated SQL bundle in {OUT_SQL_DIR}")


if __name__ == "__main__":
    main()
