#!/bin/sh
set -x

doas pacman -S alsa-utils alsa-firmware alsa-card-profiles alsa-plugins pipewire lib32-pipewire pipewire-alsa pipewire-jack pipewire-pulse pavucontrol  --noconfirm

#doas systemctl enable pipewire.service pipewire.socket pipewire-pulse.service wireplumber.service
