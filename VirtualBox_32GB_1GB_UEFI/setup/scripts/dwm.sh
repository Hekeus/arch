#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#сборка dwm, добавить установку через pacman?
git clone git://git.suckless.org/dwm src/dwm
cd src/dwm
sed -i 's/XINERAMALIBS/#XINERAMALIBS/' config.mk 
sed -i 's/XINERAMAFLAGS/#XINERAMAFLAGS/' config.mk 

#настройка dwm
cp config.def.h config.h
sed -i "s/\"st\"/\"alacritty\"/" config.h

make clean
make install

#для пользователя user создать настройку Xorg
touch /home/user/.xinitrc
echo "exec dwm" >> /home/user/.xinitrc

#----------------------------------
exit