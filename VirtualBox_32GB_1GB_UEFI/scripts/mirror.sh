#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

BASEDIR=$(dirname $(realpath "$0"))

#подключение быстрого зеркала
pacman -S --noconfirm archlinux-keyring
cp $BASEDIR/../../mirrorlist /etc/pacman.d
pacman -Syy