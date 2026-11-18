#!/usr/bin/env bash
set -euo pipefail

export POSTGRES_USER="${POSTGRES_USER:-${PGUSER:-postgres}}"
export POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-${PGPASSWORD:-postgres}}"
export POSTGRES_DB="${POSTGRES_DB:-${PGDATABASE:-geobeaconDB}}"

exec docker-entrypoint.sh "$@"
