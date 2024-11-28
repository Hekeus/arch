#!/bin/sh

set -x

# необходимо чтобы приложения могли пользоваться сервисом systemd по разрешению сетевых имен
doas ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
