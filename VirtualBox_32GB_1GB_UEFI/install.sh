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
pacstrap -K /mnt base linux linux-firmware \
sudo \
base-devel git \
networkmanager \
xf86-video-vmware xorg-server xorg-xinit \
ttf-jetbrains-mono \
libx11 libxft libxinerama \
plymouth

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#настраиваем загрузчик
sh $BASEDIR/scripts/bootloader.sh

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым root
cp -r $BASEDIR/chroot /mnt/root/

#----------------------------------
#минимальная настройка системы, остальное настраивается после перезагрузки
arch-chroot /mnt sh /root/chroot/network.sh
arch-chroot /mnt sh /root/chroot/users.sh
#arch-chroot /mnt sh /root/chroot/password.sh

#удаляем из каталога root, далее все будет выполняться под пользователем user
rm -r /mnt/root/chroot

#копируем скрипты для дальнейшего использования под пользователем user
cp -r $BASEDIR/setup /mnt/home/user

#меняем владельца каталога
arch-chroot /mnt chown -R user:user /home/user/setup

umount -R /mnt

shutdown -r now

