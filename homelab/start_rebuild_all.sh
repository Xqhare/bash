#!/usr/bin/env bash
# Stop on error
set -e

# Ensure we are in the script's directory
cd "$(dirname "$0")"

# Function to check connectivity
wait_for_internet() {
    local COUNT=0
    local MAX_RETRIES=12 # 1 minute
    echo "Checking for internet connection..."
    until ping -c 1 -W 2 8.8.8.8 &>/dev/null; do
        ((COUNT++))
        if [ $COUNT -ge $MAX_RETRIES ]; then
            echo "Network timed out after 1 minute. Aborting update."
            exit 1  # Exit with error so you know it failed in the logs
        fi
        echo "Network offline, retrying ($COUNT/$MAX_RETRIES)..."
        sleep 5
    done
    echo "Network is UP. Starting update sequence."
}

# Run the check
wait_for_internet

echo Start \& rebuild all docker images.

echo #
# CI
echo Start \& rebuild CI-Pipeline...
# - Rust
cd ci/rust/
docker compose up -d --build --force-recreate
cd ../..
echo Rust-CI up \& rebuild.

echo #
# Gitea
echo Start \& rebuild Gitea...
cd gitea/
docker pull gitea/gitea
docker compose up -d --build --pull always --force-recreate && docker image prune -f
cd ..
echo Gitea up \& rebuild.

echo #
# Samba
echo Start \& rebuild Samba...
cd samba/
docker compose pull
docker compose up -d --build && docker image prune -f
cd ..
echo Samba up \& rebuild.

echo #

# Shamash
echo "Start & rebuild Shamash..."
cd shamash/shamash
# 1. Wait for Gitea SSH port to be active
echo "Waiting for Gitea (localhost:2222) to respond..."
for i in {1..10}; do
    if timeout 1 bash -c "cat < /dev/tcp/localhost/2222" &>/dev/null; then
        echo "Gitea is ready."
        break
    fi
    echo "Gitea not ready yet, waiting... ($i/30)"
    sleep 2 
done          
# 2. Perform pull as the directory owner to use their SSH keys   
# and skip host key verification for this local connection   
OWNER=$(stat -c '%U' .) 
sudo -u "$OWNER" git -c safe.directory="$(pwd)" -c "core.sshCommand=ssh -o StrictHostKeyChecking=no" pull || echo "Warning: git pull failed, using existing local code."
cd ..
docker compose up -d --build --force-recreate
cd ..                                                                                                                                                                                       
echo Shamash up \& rebuild.     

echo #
# UrBackup
echo Start \& rebuild UrBackup
cd ur_backup/
docker compose pull
docker compose up -d --build && docker image prune -f
cd ..
echo UrBackup up \& rebuild.

echo #
# Cloudflared
echo Start \& rebuild Cloudflared
cd cloudflared/
docker compose pull
docker compose up -d --build && docker image prune -f
cd ..
echo Cloudflared up \& rebuild.

echo #
./xqhare.net/start_rebuild_all_servers.sh

echo #
echo All services up and rebuild.
echo Have a nice day!
echo #

exit 0
