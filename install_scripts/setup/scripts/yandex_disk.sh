#!/bin/sh

set -x
doas pacman -U --noconfirm setup/themes/$theme/package/yandex-disk-0.1.6.1080-2-x86_64.pkg.tar.zst
mkdir .config/yandex-disk
cp setup/themes/$theme/package/yandex_config.cfg ~/.config/yandex-disk/config.cfg


exit