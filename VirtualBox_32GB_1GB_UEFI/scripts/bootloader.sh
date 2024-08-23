#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

#настройка загрузчика
#если есть микрокод необходимо добавить два initrd initrd=\cpu_manufacturer-ucode.img initrd=\initramfs-linux.img

UUIDroot=$(lsblk /dev/sda3 -dn -o UUID) 
UUIDswap=$(lsblk /dev/sda2 -dn -o UUID)
kernelparameters="root=UUID=$UUIDroot resume=UUID=$UUIDswap initrd=/initramfs-linux.img quiet rw"

efibootmgr --create --disk /dev/sda --part 1 --label "arch" --loader /vmlinuz-linux --unicode "$kernelparameters"

#----------------------------------
exit