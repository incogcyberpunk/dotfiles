-- Master keybinding to pause all media players
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("playerctl -a pause"), { locked = true })

-- Keybindings for XF86... keys (useful for wireless heaphones or keyboards with media keys)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl -p playerctld play"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl -p playerctld pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl -p playerctld next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl -p playerctld previous"), { locked = true })
