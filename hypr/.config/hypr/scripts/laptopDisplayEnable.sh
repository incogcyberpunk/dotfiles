#!/usr/bin/env bash

config="
hl.monitor({
    output = \"eDP-1\",
    mode = \"1920x1080\",
    position = \"0x0\",
    scale = '1',
})
hl.monitor({
    output = \"HDMI-A-1\",
    disabled = true
})
"
if echo -e "$config" > ~/.config/hypr/monitors.lua ; then
    notify-send "Enabled display of Laptop"
else
    notify-send "Error enabling display of Laptop !!"
fi

waypaper --restore

