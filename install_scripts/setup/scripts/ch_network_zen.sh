#!/bin/sh
set -x

#----------------------------------
#установка менеджера сети
pacman -S --noconfirm iwd

#iwctl station wlan0 connect Tenda_CCFD80_5G --passphrase s3QFsHesQs

#включение службы сети
systemctl enable iwd

exit