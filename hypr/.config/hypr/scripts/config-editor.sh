#!/usr/bin/env bash
# Open Neovim to edit configuration files.
#
# Prerequisite: Run the setMarks.sh script once to populate the global marks.
#
# Once the marks are set, you can use this script to open Neovim
# and then use the following commands in normal mode to jump to your configs:
#
# 'N - Nvim config (init.lua)
# 'H - Hyprland config (hyprland.lua)
# 'T - Tmux config (tmux.conf)
# 'G - Ghostty config (config)

nvim
