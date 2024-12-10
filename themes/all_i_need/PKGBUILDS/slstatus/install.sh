#!/bin/sh

doas rm -r sls* pkg src
makepkg
doas pacman -R --noconfirm slstatus 
doas pacman -U --noconfirm slstatus-1.0-2-any.pkg.tar.zst
