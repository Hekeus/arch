#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка dwm
sudo pacman -U --noconfirm setup/package/dwm-6.5-1-x86_64.pkg.tar.zst

#установка виртуальной консоли st
sudo pacman -U --noconfirm setup/package/st-0.9.2-1-x86_64.pkg.tar.zst

#установка меню для запуска приложений
sudo pacman -S --noconfirm dmenu

#для пользователя user создать настройку запуска при старте X
touch /home/user/.xinitrc
echo "exec dwm" >> /home/user/.xinitrc

#----------------------------------
exit