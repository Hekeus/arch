#!/bin/sh
#Virtual box 32GB Hard 1GB RAM

set -x

#включение параллельной загрузки
doas sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 15/' /etc/pacman.conf

doas sed -i 's/#NoUpgrade   =/NoUpgrade   = usr/bin/sh/' /etc/pacman.conf
doas sed -i 's/#NoExtract   =/NoExtract   = usr/bin/sh/' /etc/pacman.conf

doas mkdir -p /etc/pacman.d/hooks
doas touch /etc/pacman.d/hooks/zsh-rehash.hook
doas sh -c 'echo "[Trigger]" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Operation = Install" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Operation = Upgrade" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Operation = Remove" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Type = Path" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Target = usr/bin/*" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "\n" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "[Action]" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Depends = zsh" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Depends = procps-ng" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "When = PostTransaction" >> /etc/pacman.d/hooks/zsh-rehash.hook'
doas sh -c 'echo "Exec = /usr/bin/pkill zsh --signal=USR1" >> /etc/pacman.d/hooks/zsh-rehash.hook'
