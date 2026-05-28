hl.bind("SUPER + x", function()
	hl.dispatch(
		hl.dsp.exec_cmd(
			"notify-send -u critical -h string:x-canonical-private-synchronous:keybinds-disable 'Hyprland Keybinds Disabled !!'"
		)
	)
	hl.dispatch(hl.dsp.submap("disableKeybinds"))
end)

hl.define_submap("disableKeybinds", function()
	hl.bind("SUPER + e", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(
			hl.dsp.exec_cmd(
				"notify-send -h string:x-canonical-private-synchronous:keybinds-disable 'Hyprland Keybinds Enabled !!'"
			)
		)
	end)
end)
