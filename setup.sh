#!/bin/bash

git remote set-url origin ssh://git@codeberg.org/ealexandrohin/dotfiles.git

(
  mkdir -p ~/Pictures/Flameshot
)

(
  ya pkg add yazi-rs/plugins:compress
  ya pkg add yazi-rs/plugins:git
  ya pkg add yazi-rs/plugins:toggle-pane
)

chsh -s /usr/bin/zsh
zsh
