#!/bin/sh

doas mkdir /home/user/etc/backup
doas rsync -aAXH --info=progress2 --filter="merge /home/user/.config/backup.filter" / /home/user/etc/backup
doas tar --zstd --cvf /home/user/cloud/backup/arch.tar.zst /home/user/etc/backup 
doas chown user:user /home/user/cloud/backup/arch.tar.zst
doas rm -r /home/user/etc/backup
yandex-disk sync
