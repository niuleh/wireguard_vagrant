#!/bin/bash

echo 'Setting static IP address for Hyper-V...'

cat << EOF > /etc/network/interfaces

source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback
iface eth0 inet static
    address 10.10.10.2
    netmask 255.255.255.252
    gateway 10.10.10.1
    dns-nameservers 10.10.10.1 1.1.1.1 8.8.8.8
EOF