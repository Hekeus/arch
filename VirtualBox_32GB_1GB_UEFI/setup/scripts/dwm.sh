#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail


#для пользователя user создать настройку Xorg
touch /home/user/.xinitrc
echo "exec dwm" >> /home/user/.xinitrc


#----------------------------------
exit