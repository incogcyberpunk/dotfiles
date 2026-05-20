#!/usr/bin/env bash
#  _   _                  _     _ _
# | | | |_   _ _ __  _ __(_) __| | | ___
# | |_| | | | | '_ \| '__| |/ _` | |/ _ \
# |  _  | |_| | |_) | |  | | (_| | |  __/
# |_| |_|\__, | .__/|_|  |_|\__,_|_|\___|
#        |___/|_|
#

SERVICE="hypridle"
if [[ "$1" == "toggle" ]]; then
    if pgrep -x "$SERVICE" >/dev/null; then
        killall hypridle
        notify-send "Hypridle" "Hypridle has been stopped."
    else
        hyprctl dispatch "hl.dsp.exec_cmd('hypridle')"
        notify-send "Hypridle" "Hypridle has been started."
    fi
fi
