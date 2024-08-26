#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

theme=all_i_need

#установка Xorg
doas pacman -S xorg-server xorg-xinit 

#установка шрифта и библиотек
doas pacman -S --noconfirm ttf-jetbrains-mono-nerd libx11 libxft libxinerama

#установка dwm
doas pacman -U --noconfirm setup/themes/$theme/package/dwm-6.5-1-x86_64.pkg.tar.zst

#установка виртуальной консоли st
doas pacman -U --noconfirm setup/themes/$theme/package/st-0.9.2-1-x86_64.pkg.tar.zst
#включение клавиши delete
doas sh -c 'echo "set enable-keypad on" >> /etc/inputrc'

#установка меню для запуска приложений
doas pacman -S --noconfirm dmenu

#установка автовхода через systemd https://wiki.archlinux.org/title/Systemd/User
doas pacman -U --noconfirm setup/packages/xlogin-git-14-1-any.pkg.tar.zst
systemctl enable xlogin@user

#установка фона рабочего стола
doas pacman -S --noconfirm feh
cp ~/setup/themes/$theme/wallpaper.png ~/.config

#для пользователя user создать настройку запуска при старте X
touch /home/user/.xinitrc
echo 'setxkbmap -layout us,ru -option "grp:caps_toggle"' >> /home/user/.xinitrc
echo 'feh --bg-fill ~/.config/wallpaper.png & exec dwm' >> /home/user/.xinitrc

#----------------------------------
exit