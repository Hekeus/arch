#!/bin/sh

set -x

#----------------------------------
#Область переопределения для разных систем

#Virtual box 32 Gb 1 Gb RAM
VIDEODRIVER=xf86-video-vmware
PARTITIONS_SCRIPT=partitions_VB.sh
NETWORK_SCRIPT=ch_network_VB.sh

#zenbook
#VIDEODRIVER=
#PARTITIONS_SCRIPT=
#NETWORK_SCRIPT=

#----------------------------------

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#подключение быстрого зеркала
sh $BASEDIR/scripts/mirror.sh

#----------------------------------
#подготовка диска
sh $BASEDIR/scripts/$PARTITIONS_SCRIPT

#----------------------------------
#минимальная установка, пакеты для сборок, драйвер видеокарты
pacstrap -K /mnt base linux linux-firmware \
base-devel git \
$VIDEODRIVER \
man-db \
vim nnn less

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#настраиваем загрузчик
sh $BASEDIR/scripts/bootloader.sh

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым root
cp -r $BASEDIR/setup/scripts /mnt/root/

#копируем скрипты для дальнейшего использования под пользователем user
cp -r $BASEDIR/setup /mnt/home/user

#копируем пакеты для установки
cp -r $BASEDIR/../packages /mnt/home/user/setup

#копируем темы для установки
cp -r $BASEDIR/../themes /mnt/home/user/setup

#меняем владельца каталога
arch-chroot /mnt chown -R user:user /home/user/setup

#----------------------------------
#минимальная настройка системы, остальное настраивается после перезагрузки
#arch-chroot /mnt sh /home/user/setup/scripts/ch_dash.sh
#arch-chroot /mnt sh /home/user/setup/scripts/$NETWORK_SCRIPT

#настройка окружения пользователя - создание пользователя, настройка doas, переменные среды, zsh
#arch-chroot /mnt sh /home/user/setup/scripts/ch_users.sh

#umount -R /mnt

#shutdown -r now

