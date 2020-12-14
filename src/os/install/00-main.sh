#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

execute "sudo pacman --noconfirm --needed -Syyu" "Pacman (update)"

./00-mandatory.sh
# ./01-aur-helper.sh
./02-absolute-basics.sh
./03-display-management.sh
./04-system-utils.sh
./05-dev-tools.sh
./05.1-nvm.sh
./05.2-npm.sh
./06-misc.sh
./99-suckless.sh

# betterlockscreen
# nextcloud
# onlyoffice
# youtube-dl
