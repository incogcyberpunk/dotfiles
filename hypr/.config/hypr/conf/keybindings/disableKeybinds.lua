hl.bind("SUPER + X", hl.dsp.exec_cmd("notify-send -u critical -h string:x-canonical-private-synchronous:keybinds-disable 'Hyprland Keybinds Disabled !!'"))
hl.bind("SUPER + X", hl.dsp.submap("disableKeybinds"))

hl.define_submap("disableKeybinds", "reset", function()
    hl.bind("SUPER + X", hl.dsp.exec_cmd("notify-send -t 1200 -h string:x-canonical-private-synchronous:keybinds-disable 'Hyprland Keybinds Enabled !!'"))
    hl.bind("SUPER + X", hl.dsp.submap("reset"))
end)
