#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

#включение параллельной загрузки
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 15/' /etc/pacman.conf

sudo sed -i 's/#NoUpgrade   =/NoUpgrade   = usr/bin/sh/' /etc/pacman.conf
sudo sed -i 's/#NoExtract   =/NoExtract   = usr/bin/sh/' /etc/pacman.conf

