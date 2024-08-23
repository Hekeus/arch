#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x


#установка временной зоны
sudo timedatectl set-ntp true
sudo timedatectl set-timezone Asia/Yekaterinburg


#----------------------------------
exit