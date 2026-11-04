#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    git

git config --global user.name "byyu"

git config --global user.email "byyu@proton.me"

git config --global init.defaultBranch master