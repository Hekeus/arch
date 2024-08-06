#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#сборка и установка виртуальной консоли st
git clone https://aur.archlinux.org/st-git.git /home/user/setup/src/st
cd /home/user/setup/src/st
makepkg -si --noconfirm
makepkg --clean

#сборка и установка рабочего стола dwm
git clone https://aur.archlinux.org/dwm-git.git /home/user/setup/src/dwm
cd /home/user/setup/src/dwm
makepkg -si --noconfirm
makepkg --clean

#установка меню для запуска приложений
pacman -S --noconfirm dmenu


#для пользователя user создать настройку Xorg
touch /home/user/.xinitrc
echo "exec dwm" >> /home/user/.xinitrc
cd /home/user

#----------------------------------
exit