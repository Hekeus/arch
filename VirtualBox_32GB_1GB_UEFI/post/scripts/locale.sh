#!/bin/bash
#Virtual box 32GB Hard 1GB RAM

set -x
set -eo pipefail

#локализация
cp locale.gen /etc
locale-gen
cp locale.conf /etc
cp vconlole.conf /etc

#----------------------------------
exit