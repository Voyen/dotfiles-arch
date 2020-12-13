#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"
echo "origin test2: $DOTFILES_ORIGIN"

main() {

  print_in_purple "\n • Initialise Authentication\n\n"

  echo "init git repo pwd1: $(pwd)"
  echo "origin test3: $DOTFILES_ORIGIN"
  if cmd_exists "git"; then
    echo "check 1: $(git config --get remote.origin.url)"
    echo "check 2: $DOTFILES_ORIGIN"
    if [ "$(git config --get remote.origin.url)" != "$DOTFILES_ORIGIN" ]; then
      echo "init git repo pwd2: $(pwd)"
      ./initialise-git-repository.sh "$DOTFILES_ORIGIN"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! $skipQuestions; then
    echo updating content...
      ./update-content.sh
    fi

  fi

  if cmd_exists "gcloud"; then

    gcloud init

  fi
  
}

main
