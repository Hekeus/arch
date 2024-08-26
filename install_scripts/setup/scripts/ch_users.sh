#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x


pacman -S --noconfirm opendoas zsh

#настройка doas
touch /etc/doas.conf
sh -c 'echo "permit :wheel" >> /etc/doas.conf'
sh -c 'echo "" >> /etc/doas.conf'
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf


#создание пользователя без пароля
useradd -m user -G wheel -s /bin/zsh
passwd -d user

#отключение входа root
passwd --lock root


#настройка переменных окружения
touch /etc/profile.d/env.sh
sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_CACHE_HOME=/home/user/.cache" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_CONFIG_HOME=/home/user/.config" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_DATA_HOME=/home/user/.local/share" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_STATE_HOME=/home/user/.local/state" >> /etc/profile.d/env.sh'

#----------------------------------
exit