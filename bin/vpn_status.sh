#!/bin/sh

VPN=$(ip addr | grep zenbook -c)
if [ $VPN -eq 0 ];
then
	echo 'VPN:off'
else
	echo 'VPN:on'
fi
