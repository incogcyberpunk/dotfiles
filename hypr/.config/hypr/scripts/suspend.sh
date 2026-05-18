#!/usr/bin/env bash

playerctl -a pause
hyprctl dispatch "hl.dsp.exec_cmd('hyprlock')"
systemctl suspend
