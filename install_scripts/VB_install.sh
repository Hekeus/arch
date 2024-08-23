#!/bin/sh

set -x

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#подключение быстрого зеркала
sh $BASEDIR/scripts/mirror.sh

#----------------------------------
#подготовка диска
sh $BASEDIR/scripts/partitions_VB.sh

VIDEODRIVER=xf86-video-vmware

#----------------------------------
#минимальная установка, пакеты для сборок, драйвер видеокарты
pacstrap -K /mnt base linux linux-firmware \
base-devel git \
networkmanager \
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

#----------------------------------
#минимальная настройка системы, остальное настраивается после перезагрузки
arch-chroot /mnt sh /root/scripts/ch_dash.sh
arch-chroot /mnt sh /root/scripts/ch_network.sh
arch-chroot /mnt sh /root/scripts/ch_users.sh
arch-chroot /mnt sh /root/scripts/ch_env.sh

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

