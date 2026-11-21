#!/bin/bash

(
  cd .work/ || exit
  yay -Bi .
)

(
  sudo touch /etc/samba/smb.conf
)

(
  chmod +x ~/w/vpn/openvpn.sh
  ~/w/vpn/openvpn.sh
)
