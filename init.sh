#!/bin/bash

(
  sudo mkdir /hdd
  sudo mkdir /usb
  sudo mkdir /ventoy
  sudo mkdir /windows
  sudo chown "$USER:$USER" /hdd /usb /ventoy /windows
)

(
  mkdir -p Pictures/Flameshot
)

(
  zsh
  chsh -s /usr/bin/zsh
)

(
  ya pkg add yazi-rs/plugins:git
)
