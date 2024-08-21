#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

pacman -S --noconfirm sudo

#включение возможности запуска sudo
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

#создание пользователя без пароля
useradd -m user -G wheel -s /bin/bash
passwd -d user

#отключение входа root
passwd --lock root

#----------------------------------
exit