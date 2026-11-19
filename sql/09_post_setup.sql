USE [master]
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
USE [dngsm]
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
USE [dnmembership]
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
USE [dnserverlog]
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
USE [dnstaging]
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
USE [dnworld]
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
