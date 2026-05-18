#!/usr/bin/env bash
if pgrep -x hyprlock ; then
    pkill -x hyprlock
fi

hyprctl dispatch "hl.dsp.exec_cmd('hyprlock')" && sleep 1 && hyprctl dispatch "hl.dsp.dpms()"
