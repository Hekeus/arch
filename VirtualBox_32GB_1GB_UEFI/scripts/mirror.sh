#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

BASEDIR=$(dirname $(realpath "$0"))

#включение параллельной загрузки
sed 's/#ParallelDownloads = 5/ParallelDownloads = 15/' /etc/pacman.conf

#подключение быстрого зеркала
pacman -S --noconfirm archlinux-keyring
cp $BASEDIR/../../mirrorlist /etc/pacman.d
pacman -Syy