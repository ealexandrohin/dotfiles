#!/bin/bash

case "$USER" in
work) branch="work" ;;
uni) branch="uni" ;;
*) branch="main" ;;
esac

sudo pacman -Sy --needed git base-devel

git init -b "$branch" -q
git remote add origin https://codeberg.org/ealexandrohin/dotfiles.git
git fetch origin
git reset --hard "origin/$branch"
git branch -u "origin/$branch"
git submodule update --init

chmod +x $branch.sh && ./$branch.sh
