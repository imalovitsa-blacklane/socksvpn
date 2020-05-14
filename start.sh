#!/bin/bash
set -e

OPENVPN_CONFIG="config.ovpn"

echo "script-security 2

up /etc/openvpn/update-resolv-conf
down /etc/openvpn/update-resolv-conf
" > fs/config.ovpn

cat "${OPENVPN_CONFIG}" >> fs/config.ovpn

docker build . -t "socksvpn"

docker run --cap-add=NET_ADMIN --rm -it -p 127.0.0.1:1080:1080 -p 127.0.0.1:5000:5000 socksvpn /bin/bash
