#!/bin/sh

set -x

#настройка zsh
touch /etc/zsh/zshenv
sh -c 'echo "export ZDOTDIR=/home/user/.config/zsh" >> /etc/zsh/zshenv'
sh -c 'echo "export ZSH_CACHE_DIR=/home/user/.cache/zsh" >> /etc/zsh/zshenv'
sh -c 'echo "export HISTFILE=/home/user/.cache/zsh/.history" >> /etc/zsh/zshenv'
sh -c 'echo "export HISTSIZE=10240" >> /etc/zsh/zshenv'
sh -c 'echo "export SAVEHIST=10240" >> /etc/zsh/zshenv'

mkdir -p /home/user/.config/zsh
mkdir -p /home/user/.cache/zsh
cp /home/user/setup/packages/.zshrc /home/user/.config/zsh/.zshrc
chown -cR user:user /home/user/.config
chown -cR user:user /home/user/.cache