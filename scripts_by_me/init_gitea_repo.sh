#!/usr/bin/env bash
# Create a Gitea repo from a template, clone it locally, and start working
# Usage: ./init_gitea_repo.sh <repo_name> <template_name[default=rust-template-bin]>
# Example: ./init_gitea_repo.sh my_project rust-template-bin
# Note: my_project should start with an uppercase letter for the `init.sh` script to work as expected

set -e

REPO_NAME=$1
REPO_NAME_ALL_LC=${REPO_NAME,,} # lowercase
TEMPLATE_NAME=${2:-rust-template-bin} # default template

TOKEN_FILE="$HOME/Adytum/Documents/tokens/gitea_adm_token.md"

if [[ ! -f "$TOKEN_FILE" ]]; then
	echo "Error: $TOKEN_FILE does not exist"
	exit 1
fi

TOKEN=$(cat "$TOKEN_FILE")

# Create repo from template on Gitea
curl -X POST "https://git.xqhare.net/api/v1/repos/Xqhare/${TEMPLATE_NAME}/generate" \
 -H "Authorization: token ${TOKEN}" \
 -H "Content-Type: application/json" \
 -d "{\"name\": \"${REPO_NAME_ALL_LC}\", \"owner\": \"Xqhare\", \"private\": false, \"git_content\": true}"

# Clone it
cd "$HOME/Adytum/Programming/rust/"
git clone "ssh://git@serverle:2222/Xqhare/${REPO_NAME_ALL_LC}.git"
cd "${REPO_NAME_ALL_LC}"

# init.sh runs automatically upon enter
if [ -f "./init.sh" ]; then
bash ./init.sh "$REPO_NAME"
fi

exit 0
