#!/usr/bin/env bash
echo Starting Xqhares update script.
echo Please enter the root password.
sudo -v
echo #
echo Update Programming Languages
echo #
echo Rust
rustup update
echo Programming Languages update complete
echo #
echo Update blobs
echo #
echo APT Update
echo #
sudo apt update -y
sudo apt full-upgrade -y
sudo apt auto-remove -y
echo APT Update complete
echo #
echo SNAP Update
echo #
sudo snap refresh
echo SNAP Update complete
echo #
echo FLATPAK Update
echo #
sudo flatpak update -y
echo FLATPAK Update complete
echo #
echo Blobs update complete
echo #
echo End of Xqhares update script.
echo Have a great day!
echo #
Exit 0
