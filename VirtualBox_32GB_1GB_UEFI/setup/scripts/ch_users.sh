#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x


pacman -S --noconfirm sudo

#включение возможности запуска sudo
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

#создание пользователя без пароля
useradd -m user -G wheel -s /bin/dash
passwd -d user

#отключение входа root
passwd --lock root

#----------------------------------
exit