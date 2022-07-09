#!/bin/sh

# Copy Ethernet IP
interface=$(ip link show | grep -i broadcast | cut -d ':' -f 2)
ether=$(ip a s $interface | egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d ' ' -f2)
echo -n "$ether" | xclip -sel clipboard