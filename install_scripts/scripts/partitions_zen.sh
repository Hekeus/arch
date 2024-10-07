#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

#удаляем все разделы
parted -s /dev/nvme0n1 mklabel msdos

#разметка диска в gpt
echo 'label: gpt' | sfdisk /dev/nvme0n1

#создание разделов
echo 'size=512M, type=U' | sfdisk -a /dev/nvme0n1
echo 'size=16G, type=S' | sfdisk -a /dev/nvme0n1
echo 'size=400G, type=L' | sfdisk -a /dev/nvme0n1

#форматирование
echo 'y' | mkfs.vfat /dev/sda1 -n EFI
echo 'y' | mkswap /dev/sda2 -L swap
echo 'y' | mkfs.ext4 /dev/sda3 -L arch

#подключение разделов
mount /dev/sda3 /mnt
swapon /dev/sda2
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
