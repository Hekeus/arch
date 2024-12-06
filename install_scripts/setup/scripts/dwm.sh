#!/bin/sh

set -x

theme=all_i_need

#установка Xorg
doas pacman -S --noconfirm xorg-server xorg-xinit xorg-xinput

#установка шрифта и библиотек
doas pacman -S --noconfirm ttf-jetbrains-mono-nerd libx11 libxft libxinerama

#установка статуса dwm
doas pacman -U --noconfirm setup/themes/$theme/package/slstatus-1.0-2-any.pkg.tar.zst

#установка dwm
doas pacman -U --noconfirm setup/themes/$theme/package/dwm-6.5-1-x86_64.pkg.tar.zst

#установка виртуальной консоли st
#обрезает изображения иконок nerd, нужно ставить патчи
#doas pacman -U --noconfirm setup/themes/$theme/package/st-0.9.2-1-x86_64.pkg.tar.zst

#установка виртуальной консоли alacritty
doas pacman -S --noconfirm alacritty
tar xzvf setup/themes/$theme/package/alacritty.tar.gz -C ~/.config

#установка менеджера буфера обмена
doas pacman -S --noconfirm xclip

#включение клавиши delete
doas sh -c 'echo "set enable-keypad on" >> /etc/inputrc'

#установка меню для запуска приложений
doas pacman -S --noconfirm dmenu

#настройка neovim с установкой менеджера плагинов
doas pacman -U --noconfirm setup/themes/$theme/package/nvim-packer-git-r574.ea0cc3c-1-any.pkg.tar.zst
tar xzvf setup/themes/$theme/package/nvim.tar.gz -C ~/.config

#установка автовхода через systemd https://wiki.archlinux.org/title/Systemd/User
doas pacman -U --noconfirm setup/packages/xlogin-git-14-1-any.pkg.tar.zst
doas systemctl enable xlogin@user

#установка фона рабочего стола
doas pacman -S --noconfirm feh
cp ~/setup/themes/$theme/wallpaper.png ~/.config

#установка регулировки яркости экрана
doas pacman -S --noconfirm brightnessctl

#установка консольного файлового менеджера
doas pacman -S --noconfirm nnn
cp ~/setup/themes/$theme/package/mimeapps.list ~/.config

#browser
doas pacman -S --noconfirm qutebrowser
doas cp ~/setup/themes/$theme/package/open_url_in_instance.sh /usr/local/bin/
doas chmod +x /usr/local/bin/open_url_in_instance.sh

doas cp ~/setup/themes/$theme/package/backup_script.sh /usr/local/bin/backup_script.sh
doas chmod +x /usr/local/bin/backup_script.sh
cp ~/setup/themes/$theme/package/backup.filter ~/.config/backup.filter 

#touchpad
doas cp ~/setup/themes/$theme/package/touchpad_toggle.sh /usr/local/bin/
doas chmod +x /usr/local/bin/touchpad_toggle.sh


#для пользователя user создать настройку запуска при старте X
touch /home/user/.xinitrc
echo 'setxkbmap -layout us,ru -option "grp:caps_toggle"' >> /home/user/.xinitrc
echo 'feh --bg-fill ~/.config/wallpaper.png & slstatus & exec dwm' >> /home/user/.xinitrc

#предопределенные настройки каталогов XDG
cp ~/setup/themes/$theme/package/user-dirs.dirs ~/.config

#----------------------------------
exit
