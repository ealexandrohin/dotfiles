#!/bin/bash

for user in $(lslogins -u -o USER --noheadings); do
  # WARNING: sanity check
  [ "$user" = root ] && continue

  su - "$user" -c "wget -O - https://codeberg.org/ealexandrohin/dotfiles/raw/branch/main/install.sh | bash"
done
