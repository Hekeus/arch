#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

pacman -S --noconfirm dash

ln -sfT dash /usr/bin/sh