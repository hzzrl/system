#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    xdg-user-dirs

xdg-user-dirs-update

mkdir -p "$HOME/.config"

mkdir -p "$HOME/DCIM/Screenshots" "$HOME/DCIM/Screenrecords"