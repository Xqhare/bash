#!/usr/bin/env bash
# Runs `git add --all && git commit -m "Commit message" && git push` for both `rust_template_bin` and `rust_template_lib`
# Usage: ./adcta_ps_templates.sh "Commit message"

set -e

COMMIT_MESSAGE=$1

if [[ -z $COMMIT_MESSAGE ]]; then
	echo "No commit message provided"
	exit 1
fi


cd rust-template-bin && git adcta "$COMMIT_MESSAGE" && g sh
cd ../rust-template-lib && git adcta "$COMMIT_MESSAGE" && g sh

exit 0
