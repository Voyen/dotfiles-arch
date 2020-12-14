#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Essentials\n\n"

pac_install "bash-completion" "Bash Completion"
pac_install "xterm"
pac_install "neovim"
pac_install "htop"
pac_install "man-db"
pac_install "nano"
pac_install "pcmanfm"
pac_install "ranger"
pac_install "exa"
# pac_install "firefox"
pac_install "qt5ct"
pac_install "gtk-engines"
pac_install "gtk-engine-murrine"
