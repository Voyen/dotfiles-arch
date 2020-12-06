#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Suckless\n\n"

suckless_install "st"
suckless_install "dmenu"
suckless_install "dwm"
suckless_install "dwmblocks"
