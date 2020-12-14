#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Display Management\n\n"

pac_install "xorg-server"
pac_install "xorg-apps"
pac_install "xorg-xinit"
pac_install "xorg-xrandr"
pac_install "arandr"
pac_install "nitrogen"
pac_install "pango"

pac_install "ttf-fira-code"
pac_install "ttf-joypixels"
pac_install "ttf-linux-libertine"
yay_install "ttf-symbola"

sudo rm /usr/share/xsessions/dwm.desktop
sudo cp ./misc/dwm.desktop /usr/share/xsessions/
