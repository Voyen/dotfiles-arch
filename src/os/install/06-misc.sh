#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Misc\n\n"

pac_install qbittorrent
pac_install vlc
pac_install figlet
pac_install lolcat
yay_install ueberzug
