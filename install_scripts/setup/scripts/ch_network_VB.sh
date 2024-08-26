#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x


#----------------------------------
#установка менеджера сети
pacman -S --noconfirm networkmanager

#включение службы сети
systemctl enable NetworkManager

exit