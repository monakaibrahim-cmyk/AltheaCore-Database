#!/bin/bash
set -euo pipefail

PERMISSIONS_CHECK_PATH="/opt/mssql/bin/permissions_check.sh"
if [ -x "$PERMISSIONS_CHECK_PATH" ]; then
    "$PERMISSIONS_CHECK_PATH"
else
    echo "Unable to run startup permissions check, exiting." >&2
    exit 1
fi

"$@" &
sql_pid="$!"

shutdown_handler() {
    echo "[dn-mssql] Shutdown signal received, stopping SQL Server (PID $sql_pid)..."
    kill -TERM "$sql_pid" 2>/dev/null || true
    wait "$sql_pid" 2>/dev/null || true
    exit 0
}
trap shutdown_handler TERM INT

if ! /opt/dn-init/scripts/init-db.sh "$sql_pid"; then
    echo "[dn-mssql] ERROR: Database initialization failed; shutting down SQL Server." >&2
    kill -TERM "$sql_pid" 2>/dev/null || true
    wait "$sql_pid" 2>/dev/null || true
    exit 1
fi

wait "$sql_pid"
