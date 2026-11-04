#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    libglib2.0-bin \
    fonts-noto-core \
    gnome-themes-extra

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' || true
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' || true
gsettings set org.gnome.desktop.interface font-name 'Noto Sans 16' || true
gsettings set org.gnome.desktop.interface document-font-name 'Noto Serif 16' || true
gsettings set org.gnome.desktop.interface monospace-font-name 'Noto Sans Mono 16' || true
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba' || true
gsettings set org.gnome.desktop.interface font-hinting 'full' || true
gsettings set org.gnome.desktop.interface font-rgba-order 'rgb' || true
gsettings set org.gnome.desktop.interface text-scaling-factor 1.0 || true