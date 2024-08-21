#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#разметка диска в gpt
echo 'label: gpt' | sfdisk /dev/sda

#создание разделов
echo 'size=512M, type=U' | sfdisk -a /dev/sda
echo 'size=2G, type=S' | sfdisk -a /dev/sda
echo 'size=30208M, type=L' | sfdisk -a /dev/sda

#форматирование
echo 'y' | mkfs.vfat /dev/sda1 -n EFI
echo 'y' | mkswap /dev/sda2 -L swap
echo 'y' | mkfs.ext4 /dev/sda3 -L arch

#подключение разделов
mount /dev/sda3 /mnt
swapon /dev/sda2
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
