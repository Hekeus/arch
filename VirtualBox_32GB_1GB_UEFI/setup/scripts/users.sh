#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#создание пользователя без пароля
useradd -m user
passwd -d user


#----------------------------------
exit