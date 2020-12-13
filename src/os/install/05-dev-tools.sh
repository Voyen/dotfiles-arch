#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dev Tools\n\n"

pac_install aws-cli
pac_install maven
pac_install shellcheck
pac_install meld
yay_install bcompare
pac_install yarn
