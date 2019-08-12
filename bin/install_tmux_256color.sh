#!/usr/bin/env bash
curl -L http://invisible-island.net/datafiles/current/terminfo.src.gz \
    -o /tmp/terminfo.src.gz
cd /tmp
gunzip terminfo.src.gz
rm -rf terminfo.src
