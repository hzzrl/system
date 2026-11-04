#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    libpam-gnome-keyring \
    gnome-keyring

if ! grep -qs "pam_gnome_keyring.so" /etc/pam.d/login; then
    sudo sed -i '/@include common-auth/a auth optional pam_gnome_keyring.so' /etc/pam.d/login
    sudo sed -i '/@include common-session/a session optional pam_gnome_keyring.so auto_start' /etc/pam.d/login
fi