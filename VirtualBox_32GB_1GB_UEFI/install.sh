#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#подключение быстрого зеркала
sh $BASEDIR/scripts/mirror.sh

#----------------------------------
#удаляем все разделы
parted -s /dev/sda mklabel msdos

#----------------------------------
#подготовка диска
sh $BASEDIR/scripts/partitions.sh

#----------------------------------
#для не виртуальных машин нужно установить микрокод и прописать в загрузчик
#минимальная установка, пакеты для сборок, драйвер видеокарты
pacstrap -K /mnt base linux linux-firmware base-devel git xf86-video-vmware

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#настраиваем загрузчик
sh $BASEDIR/scripts/bootloader.sh

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым root
cp -r $BASEDIR/setup /mnt/root/

#----------------------------------
#минимальная настройка системы, остальное настраивается после перезагрузки
arch-chroot /mnt sh /root/setup/chroot/network.sh
arch-chroot /mnt sh /root/setup/chroot/password.sh

umount -R /mnt

shutdown -r now

