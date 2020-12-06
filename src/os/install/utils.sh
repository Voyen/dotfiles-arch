#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

pac_install() {
  declare -r PACKAGE="$1"
  declare -r PACKAGE_READABLE_NAME="${2:-$1}"

  execute "sudo pacman --noconfirm --needed -S $PACKAGE >/dev/null 2>&1" "$PACKAGE_READABLE_NAME"
}

yay_install() {
  declare -r PACKAGE="$1"
  declare -r PACKAGE_READABLE_NAME="${2:-$1}"

  execute "yay -S --noconfirm "$PACKAGE" >/dev/null 2>&1" "$PACKAGE_READABLE_NAME"
}

suckless_install() {
  declare -r PACKAGE="$1"
  curdir=$(pwd)

  execute "cd ~ \
          && git clone https://github.com/Voyen/$PACKAGE \
          && cd $PACKAGE \
          && make \
          && sudo make install" \
          "$PACKAGE"
}
