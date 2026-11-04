#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
    alacritty \
    alsa-ucm-conf \
    blueman \
    brightness-udev \
    brightnessctl \
    debian-archive-keyring \
    firmware-intel-graphics \
    firmware-realtek \
    firmware-sof-signed \
    flatpak \
    fonts-noto-color-emoji \
    fonts-noto-core \
    fuzzel \
    git \
    gnome-keyring \
    gnome-themes-extra \
    grimshot \
    gvfs-backends \
    gvfs-fuse \
    intel-media-va-driver \
    intel-microcode \
    iputils-ping \
    libpam-gnome-keyring \
    mako-notifier \
    mate-polkit \
    mesa-vulkan-drivers \
    network-manager-applet \
    pavucontrol \
    pipewire-audio \
    pkexec \
    playerctl \
    pulseaudio-utils \
    stow \
    swayidle \
    swaylock \
    thermald \
    thunar \
    thunar-archive-plugin \
    tlp \
    unzip \
    waybar \
    wf-recorder \
    wireless-regdb \
    wlsunset \
    wpasupplicant \
    xarchiver \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-wlr \
    xdg-terminal-exec \
    xdg-user-dirs-gtk \
    xwayland \
    zip