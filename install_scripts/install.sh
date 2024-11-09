#!/bin/sh

set -x

#----------------------------------
#Область переопределения скриптов для разных систем
def="zen"
read -p "Name system. Default $def: " NAMESYSTEM
[[ "$NAMESYSTEM" ]] || NAMESYSTEM=$def

if [ "$NAMESYSTEM" == "zen" ]; then
	#zenbook
	VIDEODRIVER_SCRIPT=videodriver_zen.sh
	PARTITIONS_SCRIPT=partitions_zen.sh
	NETWORK_SCRIPT=ch_network_zen.sh
	BOOTLOADER_SCRIPT=bootloader_zen.sh
elif [ "$NAMESYSTEM" == "VB" ]; then
	#Virtual box 32 Gb 1 Gb RAM
	VIDEODRIVER_SCRIPT=videodriver_VB.sh
	PARTITIONS_SCRIPT=partitions_VB.sh
	NETWORK_SCRIPT=ch_network_VB.sh
	BOOTLOADER_SCRIPT=bootloader_VB.sh
fi

#----------------------------------

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#подключение быстрого зеркала
sh $BASEDIR/scripts/mirror.sh

#----------------------------------
#подготовка диска
sh $BASEDIR/scripts/$PARTITIONS_SCRIPT

#----------------------------------
#минимальная установка, пакеты для сборок
pacstrap -K /mnt base linux linux-firmware sof-firmware alsa-firmware\
base-devel git \
man-db \
neovim nnn less

#---------------------------------
#установка видеодрайвера
sh $BASEDIR/scripts/$VIDEODRIVER_SCRIPT

#----------------------------------
#сохраняем параметры подключения разделов
genfstab -U /mnt >> /mnt/etc/fstab

#настраиваем загрузчик
sh $BASEDIR/scripts/$BOOTLOADER_SCRIPT

#----------------------------------
#копируем скрипты, чтобы можно было выполнять под новым root
cp -r $BASEDIR/setup/scripts /mnt/root/

#----------------------------------
#минимальная настройка системы, остальное настраивается после перезагрузки
arch-chroot /mnt sh /root/scripts/ch_dash.sh
arch-chroot /mnt sh /root/scripts/$NETWORK_SCRIPT

#настройка окружения пользователя - создание пользователя, настройка doas, переменные среды, zsh
arch-chroot /mnt sh /root/scripts/ch_users.sh


#копируем скрипты для дальнейшего использования под пользователем user
cp -r $BASEDIR/setup /mnt/home/user

#копируем пакеты для установки
cp -r $BASEDIR/../packages /mnt/home/user/setup/packages

#копируем темы для установки
cp -r $BASEDIR/../themes /mnt/home/user/setup/themes

#настройка zsh
arch-chroot /mnt sh /root/scripts/ch_zsh.sh

#удаляем из каталога root, далее все будет выполняться под пользователем user
rm -r /mnt/root/scripts

#меняем владельца каталога
arch-chroot /mnt chown -R user:user /home/user/setup

umount -R /mnt

shutdown -r now

