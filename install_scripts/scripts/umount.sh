#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

#----------------------------------
#отмонтируем все что подключали
swapoff -a 2> /dev/null
umount /mnt/efi 2> /dev/null
umount /mnt 2> /dev/null
