#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Essentials\n\n"

pac_install "amd-ucode" "AMD Microcode"
pac_install "bash-completion" "Bash Completion"
pac_install "xterm"
pac_install "neovim"
pac_install "htop"
pac_install "man-db"
pac_install "nano"
pac_install "pcmanfm"
pac_install "ranger"
pac_install "exa"





# dunst
# firefox
# libxft-bgra-git (yay)
# lxappearance-gtk3
# neofetch
# ueberzug (yay)






# Unsure?
# gtk-engine-murrine
# gtk-engines







