#!/usr/bin/env bash

playerctl -a pause
hyprctl dispatch exec hyprlock 
sleep 1
systemctl suspend
