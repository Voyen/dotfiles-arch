#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

execute "sudo pacman -Syyu" "Pacman (update)"

./01-absolute-basics.sh
./02-aur-helper.sh
# ./03-display-management.sh
# ./01-build-essentials.sh
# ./02-basics.sh
# ./03-system-utils.sh
# ./04-dev-tools.sh
# ./05-image-tools.sh
# ./06-misc.sh

# ./99-cleanup.sh
