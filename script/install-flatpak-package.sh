#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
    md.obsidian.Obsidian \
    net.ankiweb.Anki \
    org.gnome.Loupe \
    org.gnome.Showtime