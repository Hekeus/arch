#!/bin/sh

set -x

#отключаем создание отладочных пакетов
mkdir -p ~/.config/pacman
cp /etc/makepkg.conf ~/.config/pacman/makepkg.conf
sed -i "s/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge debug lto)/OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto)/" ~/.config/pacman/makepkg.conf

exit