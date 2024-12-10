#!/bin/sh

VPN=$(ip addr | grep zenbook -c)
if [ $VPN -eq 0 ];
then
	doas wg-quick up zenbook
else
	doas wg-quick down zenbook
fi

