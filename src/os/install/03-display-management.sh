#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Display Management\n\n"

pac_install "xorg-server"
pac_install "xorg-apps"
pac_install "xorg-xinit"
pac_install "xrandr"
pac_install "arandr"
pac_install "nitrogen"
pac_install "picom"
pac_install "lightdm"
pac_install "lightdm-gtk-greeter"
pac_install "lightdm-gtk-greeter-settings"

sudo systemctl enable lightdm.service

pac_install "ttf-fira-code"
pac_install "ttf-joypixels"
pac_install "ttf-linux-libertine"
yay_install "ttf-symbola"

suckless_install "st"
suckless_install "dmenu"
suckless_install "dwm"
suckless_install "dwmblocks"

sudo cp ./misc/dwm.desktop /usr/share/xsessions/
