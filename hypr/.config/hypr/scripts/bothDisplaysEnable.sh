#!/usr/bin/env bash

config="
hl.monitor({
    output = \"eDP-1\",
    mode = \"preferred\",
    position = \"0x0\",
    scale = '1',
    bitdepth = 10,
})
hl.monitor({
    output = \"HDMI-A-1\",
    mode = \"preferred\",
    position = \"1920x0\",
    scale = '1',
    bitdepth = 10,
})
-- Rule for quickly plugging in random monitors
hl.monitor({ output = \"\", mode = \"preferred\", position = \"auto\", scale = \"1\" })

"

if echo -e "$config" > ~/.config/hypr/monitors.lua ; then
    notify-send "Enabled both displays"
else
    notify-send "Error enabling displays !!"
fi

waypaper --restore

