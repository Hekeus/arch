#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

BASEDIR=$(dirname $(realpath "$0"))

#----------------------------------
#настройка времени
sh $BASEDIR/scripts/timezone.sh
sh $BASEDIR/scripts/users.sh
sh $BASEDIR/scripts/dwm.sh