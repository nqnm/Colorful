#!/bin/sh

interface=$(ip link show | grep tun0 | awk '{print $2}' | tr -d ':')
vpn=$(ip a s $interface | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d ' ' -f2)

if [ "$interface" = "tun0" ]; then
	echo " $vpn"
else
	echo " Disconnected"
fi