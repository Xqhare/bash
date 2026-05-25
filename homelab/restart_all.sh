#!/usr/bin/env bash
# Ensure we are in the script's directory
cd "$(dirname "$0")"

echo Restarting all docker images.

echo #
# CI
echo Restarting CI-Pipeline...
# - Rust
cd ci/rust/
docker compose restart
cd ../..
echo Rust-CI restarted.

echo #
# Gitea
echo Restarting Gitea...
cd gitea/
docker compose restart
cd ..
echo Gitea restarted.

echo #
# Samba
echo Restarting Samba...
cd samba/
docker compose restart
cd ..
echo Samba restarted.

echo #
# Shamash
echo Restarting Shamash...
cd shamash/
docker compose restart
cd ..
echo Shamash restarted.

echo #
# UrBackup
echo Restarting UrBackup
cd ur_backup/
docker compose restart
cd ..
echo UrBackup restarted.

echo #
# Cloudflared
echo Restarting Cloudflared
cd cloudflared/
docker compose restart
cd ..
echo Cloudflared restarted.

echo #
./xqhare.net/restart_all_servers.sh

echo #
echo All services restarted.
echo Have a nice day!
echo #

exit 0
