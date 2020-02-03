#!/usr/bin/env bash
# This script installs modern terminfo if we are on MacOS
set -e

if [[ "$(uname)" != "Darwin" ]]; then
    echo "Not on MacOS, skipping terminfo upgrade..."
    exit
fi

cd $TMPDIR
curl -LO http://invisible-island.net/datafiles/current/terminfo.src.gz
gunzip terminfo.src.gz
tic -x terminfo.src
