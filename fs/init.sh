#!/bin/bash

danted -D
squid

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

openvpn --auth-retry interact --config /config.ovpn
