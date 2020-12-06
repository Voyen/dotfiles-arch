#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   AUR Helper\n\n"

cd ~
execute "git clone https://aur.archlinux.org/yay" "Cloning Yay"
cd yay
execute "makepkg" "Building package"
execute "sudo pacman --noconfirm -U \"$(ls | grep zst)\"" "Installing"
