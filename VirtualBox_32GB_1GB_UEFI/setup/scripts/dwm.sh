#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#сборка и установка dwm
cd setup/PKGBUILDS/dwm
makepkg -si --noconfirm

#установка меню для запуска приложений
sudo pacman -S --noconfirm dmenu


#----------------------------------
exit