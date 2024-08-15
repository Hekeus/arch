#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка dwm
sudo pacman -U --noconfirm setup/package/dwm-takensheep.pkg.tar.zst

#установка виртуальной консоли st
sudo pacman -U --noconfirm setup/package/st-takensheep.pkg.tar.zst

#установка меню для запуска приложений
sudo pacman -S --noconfirm dmenu

#установка автовхода через systemd https://wiki.archlinux.org/title/Systemd/User
sudo pacman -U --noconfirm setup/package/xlogin-git-14-1-any.pkg.tar.zst
systemctl enable xlogin@user

#установка фона рабочего стола
sudo pacman -S --noconfirm feh
cp ~/setup/wallpaper.png ~/.config

#для пользователя user создать настройку запуска при старте X
touch /home/user/.xinitrc
echo "feh --bg-fill ~/.config/wallpaper.png & exec dwm" >> /home/user/.xinitrc

#----------------------------------
exit