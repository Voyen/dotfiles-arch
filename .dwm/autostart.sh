#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "xrandr --output eDP1 --mode 2560x1440"

run "nm-applet"
run "pamac-tray"
run "xfce4-power-manager"
run "blueberry-tray"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom -b --config $HOME/.config/picom/picom.conf &
run "numlockx on"
run "volumeicon"
# sxhkd -c ~/.config/arco-dwm/sxhkd/sxhkdrc &
run "nitrogen --restore"

dwmblocks >> ~/.dwmblocks.log 2>&1 &
