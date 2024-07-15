#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#настройка загрузчика

UUIDroot=$(lsblk /dev/sda3 -dn -o UUID) 
UUIDswap=$(lsblk /dev/sda2 -dn -o UUID)
kernelparameters="root=UUID=$UUIDroot resume=UUID=$UUIDswap initrd=/initramfs-linux.img ro quiet splash"

efibootmgr --create --disk /dev/sda --part 1 --label "arch" --loader /vmlinuz-linux --unicode "$kernelparameters"

#----------------------------------
exit