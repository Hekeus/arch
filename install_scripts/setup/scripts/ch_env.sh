#!/bin/sh

set -x

touch /etc/profile.d/env.sh
sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_CACHE_HOME=/home/user/.cache" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_CONFIG_HOME=/home/user/.config" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_DATA_HOME=/home/user/.local/share" >> /etc/profile.d/env.sh'
sh -c 'echo "export XDG_STATE_HOME=/home/user/.local/state" >> /etc/profile.d/env.sh'
sh -c 'echo "export ZDOTDIR=/home/user/.config/zsh" >> /etc/profile.d/env.sh'
sh -c 'echo "export ZSH_CACHE_DIR=/home/user/.cache/zsh" >> /etc/profile.d/env.sh'

#----------------------------------
exit