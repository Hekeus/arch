#!/bin/sh

set -x

mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_DATA_HOME/zsh

touch .zshenv

echo "export ZDOTDIR=$XDG_CONFIG_HOME/zsh" >> .zshenv
echo "export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh" >> .zshenv

touch $XDG_CONFIG_HOME/zsh/.zshrc
echo "bindkey "^[[1~" beginning-of-line # Home" >> $XDG_CONFIG_HOME/zsh/.zshrc
echo "bindkey "^[[4~" end-of-line # End" >> $XDG_CONFIG_HOME/zsh/.zshrc