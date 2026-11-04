#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    stow

cd dotfile

stow -Rvt "$HOME" \
    alacritty \
    fontconfig \
    fuzzel \
    gtk \
    mako \
    sway \
    swaylock \
    waybar