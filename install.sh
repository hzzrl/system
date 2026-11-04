#!/usr/bin/env bash
set -euo pipefail

./script/install-brave.sh
./script/install-system-package.sh
./script/install-flatpak-package.sh
./script/configure-user-group.sh
./script/configure-pam-keyring.sh
./script/configure-desktop-setting.sh
./script/configure-git.sh
./script/create-user-directory.sh
./script/configure-login-profile.sh
./script/link-dotfile.sh