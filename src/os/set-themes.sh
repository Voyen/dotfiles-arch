#!/bin/bash

tar -xf $HOME/.dotfiles/src/theme/Canta-icons.tar.xz -C $HOME/.local/share/icons/
tar -xf $HOME/.dotfiles/src/theme/01-Layan-border-cursors.tar.xz -C $HOME/.local/share/icons/
tar -xf $HOME/.dotfiles/src/theme/02-Layan-cursors.tar.xz -C $HOME/.local/share/icons/
tar -xf $HOME/.dotfiles/src/theme/03-Layan-white-cursors.tar.xz -C $HOME/.local/share/icons/
tar -xf $HOME/.dotfiles/src/theme/01-Vimix-cursors.tar.xz -C $HOME/.local/share/icons/
tar -xf $HOME/.dotfiles/src/theme/02-Vimix-white-cursors.tar.xz -C $HOME/.local/share/icons/

mkdir -p $HOME/.config/gtk-3.0
cat <<EOF > $HOME/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Arc-Dark
gtk-icon-theme-name=Canta
gtk-font-name=Fira Code 11
gtk-cursor-theme-name=Layan-white-cursors
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintmedium
EOF
