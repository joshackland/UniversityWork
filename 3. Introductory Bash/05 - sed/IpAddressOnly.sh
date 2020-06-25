#!/bin/bash

#retrieve net information from IpInfo.sh and only print the lines containing 'IP Adress'
echo "$(bash IpInfo.sh | sed -n '/IP Address/ p')"