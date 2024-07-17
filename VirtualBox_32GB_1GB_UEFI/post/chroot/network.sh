#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#----------------------------------
#настройка сети
pacman -S --noconfirm networkmanager

#включение службы сети
systemctl enable NetworkManager

exit