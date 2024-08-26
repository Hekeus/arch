#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x


#установка временной зоны
doas timedatectl set-ntp true
doas timedatectl set-timezone Asia/Yekaterinburg


#----------------------------------
exit