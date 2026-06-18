#!/usr/bin/env bash

set -e

# 1. Gather Information
read -p "Project/Deity Name (e.g., Hera (First letter in uppercase please!)): " NAME
read -p "Project type (Library [l], Executable [b]): " TYPE

INIT_SCRIPT="$HOME/Adytum/Programming/bash/scripts_by_me/init_gitea_repo.sh"

if  [[ $TYPE == l* ]] ; then
	TEMPLATE_NAME="rust-template-lib"
elif [[ $TYPE == b* ]] ; then
	TEMPLATE_NAME="rust-template-bin"
else
	echo "Invalid project type"
	exit 1
fi

# 2. Create Project
bash $INIT_SCRIPT $NAME $TEMPLATE_NAME

exit 0
