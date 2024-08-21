#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#генерирование локали
sudo sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo sed -i 's/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen

sudo localectl set-locale LANG=ru_RU.UTF-8
sudo sh -c 'echo "LC_MESSAGES=en_US.UTF-8" >> /etc/locale.conf'


#----------------------------------
exit