#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

theme=all_i_need

#установка Xorg
doas pacman -S --noconfirm xorg-server xorg-xinit 

#установка шрифта и библиотек
doas pacman -S --noconfirm ttf-jetbrains-mono-nerd libx11 libxft libxinerama

#установка статуса dwm
doas pacman -U --noconfirm setup/themes/$theme/package/status_dwm-0-1-x86_64.pkg.tar.zst

#установка dwm
doas pacman -U --noconfirm setup/themes/$theme/package/dwm-6.5-1-x86_64.pkg.tar.zst

#установка виртуальной консоли st
doas pacman -U --noconfirm setup/themes/$theme/package/st-0.9.2-1-x86_64.pkg.tar.zst

#включение клавиши delete
doas sh -c 'echo "set enable-keypad on" >> /etc/inputrc'

#установка меню для запуска приложений
doas pacman -S --noconfirm dmenu

#настройка neovim с установкой менеджера плагинов
doas pacman -U --noconfirm setup/themes/$theme/package/nvim-packer-git-r574.ea0cc3c-1-any.pkg.tar.zst
tar xzvf setup/themes/$theme/package/nvim.tar.gz -C ~/.config

#установка автовхода через systemd https://wiki.archlinux.org/title/Systemd/User
doas pacman -U --noconfirm setup/packages/xlogin-git-14-1-any.pkg.tar.zst
systemctl enable xlogin@user

#установка фона рабочего стола
doas pacman -S --noconfirm feh
cp ~/setup/themes/$theme/wallpaper.png ~/.config

#surf
doas pacman -S webkit2gtk gcr

#для пользователя user создать настройку запуска при старте X
touch /home/user/.xinitrc
echo 'setxkbmap -layout us,ru -option "grp:caps_toggle"' >> /home/user/.xinitrc
echo 'feh --bg-fill ~/.config/wallpaper.png & status & exec dwm' >> /home/user/.xinitrc

#----------------------------------
exit