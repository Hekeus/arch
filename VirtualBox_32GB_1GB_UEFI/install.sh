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
ttf-jetbrains-mono-nerd \
libx11 libxft libxinerama

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#настраиваем загрузчик
sh $BASEDIR/scripts/bootloader.sh

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым root
cp -r $BASEDIR/setup/scripts /mnt/root/

#----------------------------------
#минимальная настройка системы, остальное настраивается после перезагрузки
arch-chroot /mnt sh /root/scripts/ch_network.sh
arch-chroot /mnt sh /root/scripts/ch_users.sh
#arch-chroot /mnt sh /root/scripts/ch_password.sh

#удаляем из каталога root, далее все будет выполняться под пользователем user
rm -r /mnt/root/scripts

#копируем скрипты для дальнейшего использования под пользователем user
cp -r $BASEDIR/setup /mnt/home/user

#копируем пакеты для установки
cp -r $BASEDIR/../package /mnt/home/user/setup

#копируем темы для установки
cp -r $BASEDIR/../themes /mnt/home/user/setup

#меняем владельца каталога
arch-chroot /mnt chown -R user:user /home/user/setup

umount -R /mnt

shutdown -r now

