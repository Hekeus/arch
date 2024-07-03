#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#----------------------------------
#установка загрузчика

pacman -S --noconfirm grub efibootmgr

grub-install --target=x86_64-efi --efi-directory=/efi

grub-mkconfig -o /boot/grub/grub.cfg


#----------------------------------
#настройка сети
pacman -S --noconfirm networkmanager

#включение службы сети
systemctl enable NetworkManager
#systemctl start NetworkManager


#----------------------------------
#установка пароля у root
echo root | passwd --stdin

#----------------------------------
exit