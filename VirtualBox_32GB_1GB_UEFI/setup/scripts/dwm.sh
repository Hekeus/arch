#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#сборка dwm, добавить установку через pacman?
git clone https://aur.archlinux.org/dwm.git setup/src/dwm
cd setup/src/dwm

#настройка dwm
sed -i 's/"st"/"alacritty"/' config.h

#сборка и установка через пакеты
makepkg -i

#для пользователя user создать настройку Xorg
touch /home/user/.xinitrc
echo "exec dwm" >> /home/user/.xinitrc

cd /home/user
#----------------------------------
exit