#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

sudo pacman -S --noconfirm virtualbox-guest-utils
sudo modprobe -a vboxguest vboxsf vboxvideo

#монтирование
sudo VBoxClient-all
sudo mount -t vboxsf -o uid=1000,gid=1000 share /mnt

sudo sh -c 'echo "share /mnt vboxsf defaults,uid=1000,gid=1000,rw 0 0" >> /etc/fstab'


#----------------------------------
exit