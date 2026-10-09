#!/bin/bash

git remote set-url origin ssh://git@github.com/ealexandrohin/dotfiles.git

(
  mkdir -p Pictures/Flameshot
)

(
  ya pkg add yazi-rs/plugins:git
)

chsh -s /usr/bin/zsh
zsh
