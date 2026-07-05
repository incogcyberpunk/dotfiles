#!/usr/bin/env bash

config="
hl.monitor({
    output = \"HDMI-A-1\",
    mode = \"preferred\",
    position = \"0x0\",
    scale = '1',
    bitdepth = '10',
})
hl.monitor({
    output = \"eDP-1\",
    disabled = true
})
"
if  echo -e "$config" > ~/.config/hypr/monitors.lua ; then
    notify-send "Enabled the monitor display"
else
    notify-send "Error enabling the monitor display !!"
fi
waypaper --restore

