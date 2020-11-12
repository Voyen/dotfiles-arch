#!/bin/bash

declare -r GITHUB_REPOSITORY="Voyen/dotfiles-arch"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare dotfilesDirectory="$HOME/.dotfiles"
declare skipQuestions=false

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {
  local url="$1"
  local output="$2"

  if command -v "curl" &>/dev/null; then

    curl -LsSo "$output" "$url" &>/dev/null
    #     │││└─ write output to file
    #     ││└─ show error messages
    #     │└─ don't show the progress meter
    #     └─ follow redirects

    return $?
  elif command -v "wget" &>/dev/null; then

    wget -qO "$output" "$url" &>/dev/null
    #     │└─ write output to file
    #     └─ don't show output

    return $?
  fi

  return 1
}


