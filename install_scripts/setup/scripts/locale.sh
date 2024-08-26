#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

#генерирование локали
doas sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
doas sed -i 's/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
doas locale-gen

doas localectl set-locale LANG=ru_RU.UTF-8
doas sh -c 'echo "LC_MESSAGES=en_US.UTF-8" >> /etc/locale.conf'


#----------------------------------
exit