#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка загрузчика

pacman -S --noconfirm efibootmgr
ls -l /dev/disk/by-partuuid
efibootmgr --create --disk /dev/sda --part 1 --label "arch" --loader /vmlinuz-linux --unicode "initrd=/initramfs-linux.img root=PARTUUID= resume=PARTUUID= ro" 

#----------------------------------
exit