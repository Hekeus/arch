#!/bin/sh

set -x

mkdir -p $XDG_CONFIG_HOME/zsh
mkdir -p $XDG_DATA_HOME/zsh

touch $XDG_CONFIG_HOME/zsh/.zshrc
echo "bindkey "^[[1~" beginning-of-line # Home" >> $XDG_CONFIG_HOME/zsh/.zshrc
echo "bindkey "^[[4~" end-of-line # End" >> $XDG_CONFIG_HOME/zsh/.zshrc