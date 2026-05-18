#!/usr/bin/env bash

if (pgrep waybar >/dev/null); then
    pkill --signal USR2 waybar
fi
