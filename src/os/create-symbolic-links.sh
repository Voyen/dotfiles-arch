#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

  declare -a FILES_TO_SYMLINK=(
    "profile/bash_aliases"
    "profile/bash_autocomplete"
    "profile/bash_exports"
    "profile/bash_functions"
    "profile/bash_logout"
    "profile/bash_options"
    "profile/bash_profile"
    # "profile/bash_prompt"
    "profile/profile"
    "profile/bashrc"
    "profile/curlrc"
    "profile/inputrc"
    "profile/dmrc"
    "profile/xprofile"
    "profile/Xresources"

    "git/gitattributes"
    "git/gitconfig"
    "git/gitignore_global"
  )

  local i=""
  local sourceFile=""
  local targetFile=""
  local skipQuestions=false

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  skip_questions "$@" && skipQuestions=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  for i in "${FILES_TO_SYMLINK[@]}"; do

    sourceFile="$(cd .. && pwd)/$i"
    targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

    if [ ! -e "$targetFile" ] || $skipQuestions; then

      execute \
        "ln -fs $sourceFile $targetFile" \
        "$targetFile → $sourceFile"

    elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
      print_success "$targetFile → $sourceFile"
    else

      if ! $skipQuestions; then

        ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
        if answer_is_yes; then

          rm -rf "$targetFile"

          execute \
            "ln -fs $sourceFile $targetFile" \
            "$targetFile → $sourceFile"

        else
          print_error "$targetFile → $sourceFile"
        fi

      fi

    fi

  done

  # links not in $HOME

  srcdir="$(cd ../.. && pwd)"
  execute "ln -fs $srcdir/.local/bin $HOME/.local/bin" "$HOME/.local/bin -> $srcdir/.local/bin"
  execute "ln -fs $srcdir/.dwm $HOME/.dwm" "$HOME/.dwm -> $srcdir/.dwm"
  execute "ln -fs $srcdir/.config/picom $HOME/.config/picom" "$HOME/.config/picom -> $scrdir/.config/picom"
  execute "ln -fs $srcdir/.config/ranger $HOME/.config/ranger" "$HOME/.config/ranger -> $scrdir/.config/ranger"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
  print_in_purple "\n • Create symbolic links\n\n"
  create_symlinks "$@"
}

main "$@"
