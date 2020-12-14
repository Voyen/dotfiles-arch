#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Utilities\n\n"

pac_install gparted
pac_install speedtest-cli
pac_install xclip
yay_install_conflicted xmenu
