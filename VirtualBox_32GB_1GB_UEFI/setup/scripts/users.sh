#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

pacman -S --noconfirm sudo

sed -i 's/## Defaults specification/## Defaults specification \nDefaults passwd_timeout=0/' /etc/sudoers

#включение возможности запуска sudo
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

#создание пользователя без пароля
useradd -m user -G wheel -s /bin/bash
passwd -d user

#----------------------------------
exit