#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#----------------------------------
#включение службы сети
systemctl enable NetworkManager

exit