#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#установка пароля у root
echo root | passwd --stdin

#----------------------------------
exit