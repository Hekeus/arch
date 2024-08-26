#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

doas pacman -S --noconfirm virtualbox-guest-utils
doas modprobe -a vboxguest vboxsf vboxvideo

#монтирование
doas VBoxClient-all
doas mount -t vboxsf -o uid=1000,gid=1000 share /mnt

doas sh -c 'echo "share /mnt vboxsf defaults,uid=1000,gid=1000,rw 0 0" >> /etc/fstab'


#----------------------------------
exit