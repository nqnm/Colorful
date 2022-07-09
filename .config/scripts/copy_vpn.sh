#!/bin/sh

# Copy VPN IP
interface=$(ip link show | grep -i tun | cut -d ':' -f 2)
vpn=$(ip a s $interface | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d ' ' -f2)
echo -n "$vpn" | xclip -sel clipboard