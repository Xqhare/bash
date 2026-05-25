#!/usr/bin/env bash
echo Restart, pull and build the Shamash docker image.

cd shamash/

echo Stop Shamash...
docker compose down
echo Shamash down.

echo Pull Shamash...
cd shamash/
git pull
cd ..
echo Shamash pulled.

echo Start \& build Shamash...
docker compose up -d --build --force-recreate
cd ..
echo Shamash up \& build.

