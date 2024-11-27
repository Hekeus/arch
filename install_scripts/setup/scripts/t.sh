#!/bin/sh

set -x

doas cp setup/themes/all_i_need/package/t /usr/bin/t
doas chmod ugo+x /usr/bin/t
mkdir -p ~/cloud/notes/t

