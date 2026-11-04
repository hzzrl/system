#!/usr/bin/env bash
set -euo pipefail

if ! grep -qs "exec sway" "$HOME/.profile"; then
    cat << 'EOF' >> "$HOME/.profile"

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    read -rp "Start Sway? [Y/n] " answer
    case "${answer:-y}" in [yY]*) exec sway ;; esac
fi
EOF
fi