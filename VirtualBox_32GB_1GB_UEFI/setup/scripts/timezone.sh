#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка временной зоны
sudo timedatectl set-ntp true
sudo timedatectl set-timezone Asia/Yekaterinburg


#----------------------------------
exit