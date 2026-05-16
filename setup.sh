#!/bin/bash

(
  cd .deps/ || exit
  makepkg -si
)

(
  cd yay-bin || exit
  makepkg -si
)

(
  cd .aur/ || exit
  yay -Bi .
)

(
  sudo mv /etc/ly/config.ini /etc/ly/config.ini.backup
  sudo ln -s ~/.config/ly/config.ini /etc/ly/config.ini
)

(
  sudo cp /etc/vconsole.conf /etc/vconsole.conf.backup
  awk -F= 'NR==FNR{a[$1]=$0;next} $1 in a{print a[$1];delete a[$1];next} {print} END{for(k in a)print a[k]}' ~/.config/ly/vconsole.conf /etc/vconsole.conf >/tmp/vconsole.conf && sudo mv /tmp/vconsole.conf /etc/vconsole.conf
  sudo mkinitcpio -P
)

(
  sudo cp /usr/share/applications/Alacritty.desktop /usr/share/applications/Alacritty-open.desktop
  sudo sed -i "s/^Exec=alacritty$/Exec=alacritty --working-directory %U/" /usr/share/applications/Alacritty-open.desktop
)
