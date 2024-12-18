#!/bin/sh

set -x

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
sh $BASEDIR/scripts/wifi_74.sh
sh $BASEDIR/scripts/pacman.sh
sh $BASEDIR/scripts/locale.sh
sh $BASEDIR/scripts/timezone.sh
sh $BASEDIR/scripts/makepkg.sh
sh $BASEDIR/scripts/dwm.sh
sh $BASEDIR/scripts/sound.sh
sh $BASEDIR/scripts/yandex_disk.sh
sh $BASEDIR/scripts/software.sh
sh $BASEDIR/scripts/t.sh
sh $BASEDIR/scripts/network.sh
sh $BASEDIR/scripts/clean.sh

shutdown -r now
