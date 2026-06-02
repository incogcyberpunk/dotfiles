#!/usr/bin/env bash

animationsState=$(hyprctl getoption animations.enabled | head -n 1 | awk '{print $2}')

if $animationsState; then
    hyprctl eval 'hl.config({animations = {enabled = false}})'
    hyprctl eval 'hl.config({decoration = {blur = {enabled = false}}})'
    notify-send "Animations & Decorations Disabled" -t 0 -h string:x-canonical-private-synchronous:animationsToggle

    # Dim brightness to 20%
    brightnessctl set 10% -s
else
    hyprctl eval 'hl.config({animations = {enabled = true}})'
    hyprctl eval 'hl.config({decoration = {blur = {enabled = true}}})'
    notify-send "Animations & Decorations Enabled" -t 0 -h string:x-canonical-private-synchronous:animationsToggle
    
    # Restore brightness to previous level
    brightnessctl -r
fi


