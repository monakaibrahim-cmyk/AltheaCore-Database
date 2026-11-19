SET NOCOUNT ON;
GO
USE [dngsm]
GO
/****** Object:  DatabaseRole [AppServer]    Script Date: 11/14/2026 8:47:03 AM ******/
CREATE ROLE [AppServer]
GO
USE [dngsm]
GO
/****** Object:  User [SPExecutor]    Script Date: 11/14/2026 8:47:02 AM ******/
CREATE USER [SPExecutor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SPExecutor]
GO
USE [dngsm]
GO
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')
    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];
GO
USE [dnmembership]
GO
/****** Object:  DatabaseRole [AppServer]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'AppServer' AND type = 'R')
CREATE ROLE [AppServer]
GO
USE [dnmembership]
GO
/****** Object:  User [SPExecutor]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SPExecutor')
CREATE USER [SPExecutor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
USE [dnmembership]
GO
/****** Object:  User [web]    Script Date: 11/14/2026 8:51:03 AM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'web')
CREATE USER [web] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
USE [dnmembership]
GO
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')
    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];
GO
USE [dnserverlog]
GO
/****** Object:  DatabaseRole [AppServer]    Script Date: 11/14/2026 8:57:58 AM ******/
CREATE ROLE [AppServer]
GO
USE [dnserverlog]
GO
/****** Object:  User [SPExecutor]    Script Date: 11/14/2026 8:57:58 AM ******/
CREATE USER [SPExecutor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
USE [dnserverlog]
GO
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')
    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];
GO
USE [dnstaging]
GO
/****** Object:  DatabaseRole [AppServer]    Script Date: 11/14/2026 9:00:06 AM ******/
CREATE ROLE [AppServer]
GO
USE [dnstaging]
GO
/****** Object:  User [SPExecutor]    Script Date: 11/14/2026 9:00:06 AM ******/
CREATE USER [SPExecutor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
USE [dnstaging]
GO
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')
    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];
GO
USE [dnworld]
GO
/****** Object:  DatabaseRole [AppServer]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE ROLE [AppServer]
GO
USE [dnworld]
GO
/****** Object:  User [SPExecutor]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE USER [SPExecutor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
USE [dnworld]
GO
/****** Object:  User [web]    Script Date: 11/14/2026 8:54:15 AM ******/
CREATE USER [web] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
USE [dnworld]
GO
IF EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'SPExecutor')
    ALTER ROLE [db_owner] ADD MEMBER [SPExecutor];
GO
