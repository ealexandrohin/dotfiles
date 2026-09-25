#!/bin/bash

git remote set-url origin ssh://git@github.com/ealexandrohin/dotfiles.git

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
