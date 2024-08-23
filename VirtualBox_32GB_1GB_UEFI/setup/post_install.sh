#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
sh $BASEDIR/scripts/pacman.sh
sh $BASEDIR/scripts/environment.sh
sh $BASEDIR/scripts/locale.sh
sh $BASEDIR/scripts/timezone.sh
sh $BASEDIR/scripts/makepkg.sh
sh $BASEDIR/scripts/virtualbox.sh
sh $BASEDIR/scripts/dwm.sh

shutdown -r now