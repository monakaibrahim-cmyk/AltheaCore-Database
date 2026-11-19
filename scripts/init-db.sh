#!/bin/bash
set -euo pipefail
set +H

sql_pid="${1:-}"
SQL_DIR="/opt/dn-init/sql"
INIT_MARKER="/var/opt/mssql/.dn_initialized"

SQLCMD="/opt/mssql-tools18/bin/sqlcmd"
if [ ! -x "$SQLCMD" ]; then
    SQLCMD="/opt/mssql-tools/bin/sqlcmd"
fi
if [ ! -x "$SQLCMD" ]; then
    echo "[dn-mssql] ERROR: sqlcmd binary not found." >&2
    exit 1
fi

SA_PW="${MSSQL_SA_PASSWORD:-${SA_PASSWORD:-}}"
if [ -z "$SA_PW" ]; then
    echo "[dn-mssql] ERROR: MSSQL_SA_PASSWORD (or SA_PASSWORD) must be set." >&2
    exit 1
fi

APP_USER="${DN_APP_USER:-DragonNest}"
APP_PW="${DN_APP_PASSWORD:-}"

sqlcmd_sa() {
    SQLCMDPASSWORD="$SA_PW" "$SQLCMD" -C -S 127.0.0.1 -U sa -I -b "$@"
}

echo "[dn-mssql] Waiting for SQL Server to become ready..."
sleep 4
ready=0
for _ in $(seq 1 60); do
    if [ -n "$sql_pid" ] && ! kill -0 "$sql_pid" 2>/dev/null; then
        echo "[dn-mssql] ERROR: sqlservr exited during startup." >&2
        exit 1
    fi
    state_sum="$(sqlcmd_sa -h -1 -W -Q "SET NOCOUNT ON; SELECT ISNULL(SUM(state), 1) FROM sys.databases;" 2>/dev/null | tr -d '[:space:]' || true)"
    if [ "$state_sum" = "0" ]; then
        ready=1
        break
    fi
    sleep 2
done

if [ "$ready" -ne 1 ]; then
    echo "[dn-mssql] ERROR: Timed out waiting for SQL Server readiness." >&2
    exit 1
fi
echo "[dn-mssql] SQL Server is ready."

db_count="$(sqlcmd_sa -h -1 -W -Q "SET NOCOUNT ON; SELECT COUNT(*) FROM sys.databases WHERE name IN (N'dngsm',N'dnmembership',N'dnserverlog',N'dnstaging',N'dnworld');" | tr -d '[:space:]')"

if [ "$db_count" = "0" ]; then
    echo "[dn-mssql] Initializing Cap60 databases from $SQL_DIR..."
    for phase in \
        01_databases.sql \
        02_principals.sql \
        03_tables.sql \
        04_foreign_keys.sql \
        05_functions.sql \
        06_views.sql \
        07_triggers.sql \
        08_procedures.sql
    do
        echo "[dn-mssql] Running $phase ..."
        sqlcmd_sa -i "$SQL_DIR/$phase"
    done
    touch "$INIT_MARKER"
    echo "[dn-mssql] All 5 databases initialized successfully."
elif [ "$db_count" = "5" ]; then
    echo "[dn-mssql] All 5 databases already exist; skipping schema/data initialization."
    touch "$INIT_MARKER"
else
    echo "[dn-mssql] ERROR: Partial database state detected ($db_count of 5 databases exist). Refusing to overwrite existing data." >&2
    exit 1
fi

if [ -n "$APP_PW" ]; then
    safe_app_user="${APP_USER//\'/\'\'}"
    safe_app_pw="${APP_PW//\'/\'\'}"
    echo "[dn-mssql] Ensuring SQL login '$APP_USER' and database role mappings..."
    sqlcmd_sa -v DN_APP_USER="$safe_app_user" DN_APP_PASSWORD="$safe_app_pw" -i "$SQL_DIR/09_post_setup.sql"
else
    echo "[dn-mssql] DN_APP_PASSWORD is empty; skipping application login setup (09_post_setup.sql)."
fi

echo "[dn-mssql] Database setup complete."
