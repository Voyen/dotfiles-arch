#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

main() {

  print_in_purple "\n • Initialise Authentication\n\n"

  echo "init git repo pwd1: $(pwd)"
  if cmd_exists "git"; then

    if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
      echo "init git repo pwd2: $(pwd)"
      ./initialise-git-repository.sh "$DOTFILES_ORIGIN"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! $skipQuestions; then
      ./update-content.sh
    fi

  fi

  if cmd_exists "gcloud"; then

    gcloud init

  fi
  
}

main
