# Dragon Nest Cap 60 - MSSQL Docker Setup

Self-contained SQL Server 2022 Docker setup that initializes all 5 Dragon Nest databases (`dngsm`, `dnmembership`, `dnserverlog`, `dnstaging`, `dnworld`) from pre-bundled SQL scripts inside `sql/`. **No Python or host SQL Server installation is required on Windows** — only Docker Desktop.

## Contents
- `Dockerfile`: `mcr.microsoft.com/mssql/server:2022-latest` with pre-built SQL initialization scripts (`sql/01..09`) baked into `/opt/dn-init/`.
- `docker-compose.yml`: Defines the `mssql` service (`container_name: dn_cap60_mssql`), persistent volume `dn_cap60_mssql_data`, port `1433`, and database readiness healthcheck.
- `.env`: Runtime configuration (`MSSQL_SA_PASSWORD`, `DN_APP_USER`, `DN_APP_PASSWORD`, `MSSQL_PORT`, `MSSQL_PID`).
- `scripts/entrypoint.sh` & `scripts/init-db.sh`: Runs inside the Linux container (`bash` + `sqlcmd`), waits for readiness, runs `sql/01..08` automatically on a fresh instance (when none of the 5 databases exist), and applies `sql/09_post_setup.sql` idempotently so the `DragonNest` SQL login matches `.env` / `D:\Cap60\Server\Config\odbc.ini`.
- `scripts/resync-sql.bat` & `scripts/build-sql-bundle.py`: Optional helper to regenerate `sql/01..09` from `D:\Cap60\Database` inside an ephemeral Docker `python:3.12-alpine` container (again requiring zero Python on the Windows host).

## Usage

From `R:\Server\MSSQL`:

1. Build and start with Docker Compose (requires only Docker Desktop):
   ```powershell
   docker compose up -d --build
   ```

2. Or build and run directly with `docker`:
   ```powershell
   docker build -t dn-cap60-mssql:2022 .
   docker run -d --name dn_cap60_mssql --env-file .env -p 1433:1433 -v dn_cap60_mssql_data:/var/opt/mssql dn-cap60-mssql:2022
   ```

3. Reset / re-initialize databases cleanly from scratch:
   ```powershell
   docker compose down -v
   docker compose up -d --build
   ```

4. Re-sync `sql/` after editing files in `D:\Cap60\Database` (runs via Docker, no host Python required):
   ```powershell
   .\scripts\resync-sql.bat
   docker compose build
   ```
