#!/bin/sh

set -x

#настройка zsh
touch /etc/zsh/zshenv
sh -c 'echo "export ZDOTDIR=/home/user/.config/zsh" >> /etc/zsh/zshenv'
sh -c 'echo "export ZSH_CACHE_DIR=/home/user/.cache/zsh" >> /etc/zsh/zshenv'

mkdir -p /home/user/.config/zsh
mkdir -p /home/user/.cache/zsh
chown -cR user:user /home/user/.config
chown -cR user:user /home/user/.cache
cp /home/user/setup/packages/.zshrc /home/user/.config/zsh/.zshrc
