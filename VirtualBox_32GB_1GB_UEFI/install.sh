#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#подключение быстрого зеркала
sh BASEDIR/scripts/mirror.sh

#----------------------------------
#удаляем все разделы
parted -s /dev/sda mklabel msdos

#----------------------------------
#подготовка диска
sh BASEDIR/scripts/partitions.sh

#----------------------------------
#минимальная установка, остальное установится в новом окружении
pacstrap -K /mnt base linux linux-firmware

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#настраиваем загрузчки
sh BASEDIR/scripts/bootloader.sh

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым chroot
cp -r $BASEDIR/post /mnt/root/

#----------------------------------
#настройка системы
arch-chroot /mnt sh /root/post/network.sh
arch-chroot /mnt sh /root/post/password.sh


