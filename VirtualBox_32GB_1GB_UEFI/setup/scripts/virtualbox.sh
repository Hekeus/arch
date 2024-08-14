#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

sudo pacman -S --noconfirm virtualbox-guest-utils
sudo modprobe -a vboxguest vboxsf vboxvideo

#нужно засунуть в автозапуск
sudo VBoxClient-all
sudo mount -t vboxsf -o uid=1000,gid=1000 share /mnt

#----------------------------------
exit