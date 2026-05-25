#!/usr/bin/env bash
# Ensure we are in the script's directory
cd "$(dirname "$0")"

echo Starting all docker images.

echo #
# CI
echo Start CI-Pipeline...
# - Rust
cd ci/rust/
docker compose up -d
cd ../..
echo Rust-CI up.

echo #
# Gitea
echo Start Gitea...
cd gitea/
docker compose up -d
cd ..
echo Gitea up.

echo #
# Samba
echo Starting Samba...
cd samba/
docker compose up -d
cd ..
echo Samba up.

echo #
# Shamash
echo Starting Shamash...
cd shamash/
docker compose up -d
cd ..
echo Shamash up.

echo #
# UrBackup
echo Starting UrBackup
cd ur_backup/
docker compose up -d
cd ..
echo UrBackup up.

echo #
# Cloudflared
echo Starting Cloudflared
cd cloudflared/
docker compose up -d
cd ..
echo Cloudflared up.

echo #
./xqhare.net/start_all_servers.sh

echo #
echo All services up.
echo Have a nice day!
echo #

exit 0
