#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка временной зоны
timedatectl set-ntp true
timedatectl set-timezone Asia/Yekaterinburg


#----------------------------------
exit