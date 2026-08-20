-- Master keybinding to pause all media players
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("playerctl -a pause"), { locked = true })
