#!/bin/bash

(
  cd .work/ || exit
  yay -Bi .
)

(
  sudo touch /etc/samba/smb.conf
)
