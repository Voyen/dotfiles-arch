#!/bin/bash

export GITHUB_REPOSITORY="Voyen/dotfiles-arch"

export DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
export DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/main"
export DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/src/os/utils.sh"

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

    curl -H 'Cache-Control: no-cache' -LsSo "$output" "$url" &>/dev/null
    #     │││└─ write output to file
    #     ││└─ show error messages
    #     │└─ don't show the progress meter
    #     └─ follow redirects

    return $?
  elif command -v "wget" &>/dev/null; then

    wget -qO --no-cache --no-cookies "$output" "$url" &>/dev/null
    #     │└─ write output to file
    #     └─ don't show output

    return $?
  fi

  return 1
}

download_dotfiles() {

  local tmpFile=""

  print_in_purple "\n • Download and extract archive\n\n"

  tmpFile="$(mktemp /tmp/XXXXX)"

  download "$DOTFILES_TARBALL_URL" "$tmpFile"
  print_result $? "Download archive" "true"
  printf "\n"

  if ! $skipQuestions; then

    ask_for_confirmation "Do you want to store the dotfiles in '$dotfilesDirectory'?"

    if ! answer_is_yes; then
      dotfilesDirectory=""
      while [ -z "$dotfilesDirectory" ]; do
        ask "Please specify another location for the dotfiles (path): "
        dotfilesDirectory="$(get_answer)"
      done
    fi

    # Ensure the `dotfiles` directory is available
    while [ -e "$dotfilesDirectory" ]; do
      ask_for_confirmation "'$dotfilesDirectory' already exists, do you want to overwrite it?"
      if answer_is_yes; then
        rm -rf "$dotfilesDirectory"
        break
      else
        dotfilesDirectory=""
        while [ -z "$dotfilesDirectory" ]; do
          ask "Please specify another location for the dotfiles (path): "
          dotfilesDirectory="$(get_answer)"
        done
      fi
    done

    printf "\n"

  else

    rm -rf "$dotfilesDirectory" &>/dev/null

  fi

  mkdir -p "$dotfilesDirectory"
  print_result $? "Create '$dotfilesDirectory'" "true"

  # Extract archive in the `dotfiles` directory.

  extract "$tmpFile" "$dotfilesDirectory"
  print_result $? "Extract archive" "true"

  rm -rf "$tmpFile"
  print_result $? "Remove archive"

  cd "$dotfilesDirectory" || return 1

}

download_utils() {

  local tmpFile=""

  tmpFile="$(mktemp /tmp/XXXXX)"

  download "$DOTFILES_UTILS_URL" "$tmpFile" &&
    . "$tmpFile" &&
    rm -rf "$tmpFile" &&
    return 0

  return 1

}

extract() {

  local archive="$1"
  local outputDir="$2"

  if command -v "tar" &>/dev/null; then
    tar -zxf "$archive" --strip-components 1 -C "$outputDir"
    return $?
  fi

  return 1

}

verify_os() {

  local os_name="$(get_os)"

  # Check if the OS is `arcolinux` or `arch`

  if [ "$os_name" == "arcolinux" ] || [ "$os_name" == "arch" ]; then
    return 0
  else
    printf "Sorry, this script is intended only for Arch based distributions."
  fi

  return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

  # Ensure that the following actions are made relative to this file's path.

  cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Load utils

  if [ -x "utils.sh" ]; then
    . "utils.sh" || exit 1
  else
    download_utils || exit 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Ensure the OS is supported and
  # it's above the required version.

  verify_os || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  skip_questions "$@" && skipQuestions=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ask_for_sudo

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if this script was run directly (./bootstrap.sh),
  # and if not, it most likely means that the dotfiles were not
  # yet set up, and they will need to be downloaded.

  printf "%s" "${BASH_SOURCE[0]}" | grep "bootstrap.sh" &>/dev/null || download_dotfiles

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/create-directories.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # TODO: Add new util to back up default dotfiles
  # ./create_backups.sh "$@"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/create-symbolic-links.sh "$@"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/create-local-config-files.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/install/00-main.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/init-auth.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/set-initial-wallpaper.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/set-themes.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  ./src/os/colorise-pacman.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./src/os/enable-tap-to-click.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # ./src/os/fix-audio.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # clear
  # figlet "... and we're live!" | lolcat

  # if ! $skipQuestions; then
  #   ./src/os/restart.sh
  # fi

}

main "$@"
