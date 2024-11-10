#!/bin/sh
set -x

#----------------------------------
#установка менеджера сети
pacman -S --noconfirm iwd

#iwctl station wlan0 connect Tenda_CCFD80_5G --passphrase s3QFsHesQs

#включение службы сети
doas systemctl enable iwd
doas systemctl enable systemd-resolved

#настройки iwd
doas sh -c 'echo "[General]" >> /etc/iwd/main.conf'
doas sh -c 'echo "EnableNetworkConfiguration=true" >> /etc/iwd/main.conf'

exit
