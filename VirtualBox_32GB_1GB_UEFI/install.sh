#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#подключение быстрого зеркала
pacman -S --noconfirm archlinux-keyring
cp $BASEDIR/../mirrorlist /etc/pacman.d
pacman -Syy

#----------------------------------
#удаляем все разделы
parted -s /dev/sda mklabel msdos

#----------------------------------
#подготовка диска

#разметка диска в gpt
echo 'label: gpt' | sfdisk /dev/sda

#создание разделов
echo 'size=512M, type=U' | sfdisk -a /dev/sda
echo 'size=2G, type=S' | sfdisk -a /dev/sda
echo 'size=30208M, type=L' | sfdisk -a /dev/sda

#форматирование
echo 'y' | mkfs.vfat /dev/sda1 -n efi
echo 'y' | mkswap /dev/sda2 -L swap
echo 'y' | mkfs.ext4 /dev/sda3 -L arch

#подключение разделов
mount /dev/sda3 /mnt
swapon /dev/sda2
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi

#----------------------------------
#минимальная установка, остальное установится в новом окружении
pacstrap -K /mnt base linux linux-firmware

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым chroot
cp -r $BASEDIR/post /mnt/root/

#----------------------------------
arch-chroot /mnt sh /root/post/network.sh
arch-chroot /mnt sh /root/post/password.sh


