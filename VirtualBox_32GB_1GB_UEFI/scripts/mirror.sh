#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#включение параллельной загрузки
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 15/' /etc/pacman.conf

#подключение быстрого зеркала
pacman -S --noconfirm archlinux-keyring
pacman -S --noconfirm reflector
reflector --country Russia --latest 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist
pacman -Syy