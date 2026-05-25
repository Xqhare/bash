#!/usr/bin/env bash
# Ensure we are in the script's directory
cd "$(dirname "$0")"

echo Stop all docker images.

echo #
# CI
echo Stop CI-Pipeline...
# - Rust
cd ci/rust/
docker compose down
cd ../..
echo Rust-CI down.

echo #
# Gitea
echo Stop Gitea...
cd gitea/
docker compose down
cd ..
echo Gitea down.

echo #
# Samba
echo Stop Samba...
cd samba/
docker compose down
cd ..
echo Samba down.

echo #
# Shamash
echo Stop Shamash...
cd shamash/
docker compose down
cd ..
echo Shamash down.

echo #
# UrBackup
echo Stop UrBackup...
cd ur_backup/
docker compose down
cd ..
echo UrBackup down.

echo #
# Cloudflared
echo Stop Cloudflared...
cd cloudflared/
docker compose down
cd ..
echo Cloudflared down.

echo #
./xqhare.net/stop_all_servers.sh

echo #
echo All services down.
echo Have a nice day!
echo #

exit 0
