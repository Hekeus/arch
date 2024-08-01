#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка пакетов для компилирования
pacman -S --noconfirm base-devel git

#установка x
pacman -S --noconfirm xorg-server xorg-init

#зависимости dwm, нужны ли?
pacman -S --noconfirm libx11 libxft

#установка моноширинного шрифта
pacman -S --noconfirm terminus-font

#сборка dwm, добавить установку через pacman?
mkdir src
git clone git://git.suckless.org/dwm src/dwm
cd src/dwm
sed -i 's/XINERAMALIBS/#XINERAMALIBS/' config.mk 
sed -i 's/XINERAMAFLAGS/#XINERAMAFLAGS/' config.mk 

make clean
make install

#для пользователя user создать настройку Xorg
touch /home/user/.xinitrc
echo "exec dwm" >> /home/user/.xinitrc

#----------------------------------
exit