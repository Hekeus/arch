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

#настройка zsh

mkdir -p /home/user/.config/zsh
mkdir -p /home/user/.cache/zsh

touch /home/user/.config/zsh/.zshrc
echo "bindkey "^[[1~" beginning-of-line # Home" >> /home/user/.config/zsh/.zshrc
echo "bindkey "^[[4~" end-of-line # End" >> /home/user/.config/zsh/.zshrc

#----------------------------------
exit