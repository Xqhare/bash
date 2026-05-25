#!/usr/bin/env bash
# Stop on error
set -e

./stop_all.sh
./start_rebuild_all.sh

exit 0
