#!/usr/bin/env bash

playerctl -a pause
hyprctl dispatch "hl.dsp.exec_cmd('hyprlock')"
sleep 2
systemctl suspend
