#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка dwm
pacman -U --noconfirm setup/package/dwm-6.5-1-x86_64.pkg.tar.zst

#установка виртуальной консоли st

#установка меню для запуска приложений
sudo pacman -S --noconfirm dmenu


#----------------------------------
exit