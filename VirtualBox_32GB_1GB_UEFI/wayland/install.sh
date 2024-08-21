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
xf86-video-vmware \
ttf-jetbrains-mono-nerd \
vim nnn

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

#удаляем из каталога root, далее все будет выполняться под пользователем user
rm -r /mnt/root/scripts

umount -R /mnt

shutdown -r now

