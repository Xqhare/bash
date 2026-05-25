#!/usr/bin/env bash
ls -al /var/crash
sudo journalctl  -b -1 -e 
Exit 0
