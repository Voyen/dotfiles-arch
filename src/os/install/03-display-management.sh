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
yay_install "picom-ibhagwan-git"
pac_install "pango"
pac_install "lightdm"
pac_install "lxappearance-gtk3"
pac_install "lightdm-gtk-greeter"
pac_install "lightdm-gtk-greeter-settings"

execute "sudo systemctl enable lightdm.service" "Enabling lightdm"

pac_install "ttf-fira-code"
pac_install "ttf-joypixels"
pac_install "ttf-linux-libertine"
yay_install "ttf-symbola"

sudo mkdir /usr/share/xsessions
sudo cp ./misc/dwm.desktop /usr/share/xsessions/

pac_install "arc-gtk-theme"
execute "echo 1 | yay --answerdiff N --answerclean N -S qt5-styleplugins" "qt5-styleplugins"
execute "yay --answerdiff N --answerclean N -S numix-circle-icon-theme-git"
