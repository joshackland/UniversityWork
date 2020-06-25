#!/bin/bash 

#get info about networking from the ifconfig command
net_info="$(ifconfig)"

#select the line starting with 'inet ' and format the contents to display the IP address, subnet mask, and broadcast address
addresses=$(echo "$net_info" | sed -n '/inet / {
    s/inet/IP Address:/
    s/netmask/\n\t\tSubnet Mask:/
    s/broadcast/\n\t\tBroadcast Address:/
    p
}')

echo -e "IP addresses on this computer are:\n$addresses"