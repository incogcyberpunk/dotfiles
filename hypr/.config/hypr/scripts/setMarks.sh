#!/usr/bin/env bash
# This script sets global marks in Neovim for important config files.
# It opens each file in a headless nvim instance, sets the mark, and saves.

# H for Hyprland config
nvim --headless -c "normal! mH" -c "wq" "$HOME/.config/hypr/hyprland.lua"

# T for Tmux config
nvim --headless -c "normal! mT" -c "wq" "$HOME/.config/tmux/tmux.conf"

# G for Ghostty config
nvim --headless -c "normal! mG" -c "wq" "$HOME/.config/ghostty/config"

# N for Nvim config (init.lua)
nvim --headless -c "normal! mN" -c "wq" "$HOME/.config/nvim/init.lua"
