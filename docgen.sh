#!/usr/bin/env bash
set -euo pipefail
set -x

if [[ $# -lt 1 ]]; then
    SCRIPT_NAME=$(basename "$0")
    echo "Usage: $SCRIPT_NAME author/reponame"
    exit 1
fi

DIR="$HOME/repos/"
REPO_URL="https://github.com/$1"
LIB_NAME=$(basename "$1") # the old "splitting URLs with filesystem methods" conundrum

cd "$DIR"
if [[ -d "$LIB_NAME" ]]; then
    cd "$LIB_NAME"
    git pull
else
    git clone "$REPO_URL"
    cd "$LIB_NAME"
fi

cd docs
make html
cd _build

doc2dash -n "$LIB_NAME" html
if [[ ! -d "${LIB_NAME}.docset" ]]; then
    echo "Generated doc, but I can't find it?"
    exit 1
fi

echo "Generation complete, file is at: $(pwd)/${LIB_NAME}.docset"
