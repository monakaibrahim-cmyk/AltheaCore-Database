@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
for %%I in ("%SCRIPT_DIR%\..") do set "MSSQL_DIR=%%~fI"
for %%I in ("%MSSQL_DIR%\..") do set "PARENT_DIR=%%~fI"
for %%I in ("%PARENT_DIR%\..") do set "GRANDPARENT_DIR=%%~fI"

set "DB_DIR="
if exist "%PARENT_DIR%\Database" (
    set "DB_DIR=%PARENT_DIR%\Database"
) else if exist "%GRANDPARENT_DIR%\Database" (
    set "DB_DIR=%GRANDPARENT_DIR%\Database"
)

if not defined DB_DIR (
    echo [ERROR] Database folder not found under "%PARENT_DIR%" or "%GRANDPARENT_DIR%".
    exit /b 1
)

where docker >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker CLI not found in PATH.
    exit /b 1
)

echo [dn-mssql] Regenerating sql\01..09 from "%DB_DIR%" using Docker ^(no host Python needed^)...
docker run --rm ^
    -e SRC_DB_ROOT=/src/Database ^
    -e OUT_SQL_DIR=/src/MSSQL/sql ^
    -v "%DB_DIR%:/src/Database:ro" ^
    -v "%MSSQL_DIR%:/src/MSSQL" ^
    python:3.12-alpine python /src/MSSQL/scripts/build-sql-bundle.py

exit /b %ERRORLEVEL%
