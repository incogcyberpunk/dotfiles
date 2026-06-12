local scripts = "~/.config/hypr/scripts"

hl.define_submap("changeBrightness", function()
	hl.bind("J", hl.dsp.exec_cmd(scripts .. "/changeBrightness.sh decrease"), { repeating = true })
	hl.bind("K", hl.dsp.exec_cmd(scripts .. "/changeBrightness.sh increase"), { repeating = true })

	hl.bind("Q", function()
		hl.dispatch(
			hl.dsp.exec_cmd(
				"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Brightness Submap' "
			)
		)
		hl.dispatch(hl.dsp.submap("reset"))
	end, { locked = true })
	hl.bind("ESCAPE", function()
		hl.dispatch(
			hl.dsp.exec_cmd(
				"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Brightness Submap' "
			)
		)
		hl.dispatch(hl.dsp.submap("reset"))
	end, { locked = true })
	-- hl.bind("catchall", function()
	-- 	hl.dispatch(
	-- 		hl.dsp.exec_cmd(
	-- 			"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Brightness Submap' "
	-- 		)
	-- 	)
	-- 	hl.dispatch(hl.dsp.submap("reset"))
	-- end, { locked = true })
end)

hl.bind(
	"SUPER + B",
	hl.dsp.exec_cmd(
		"notify-send -u low -h string:x-canonical-private-synchronous:brightness-submap 'Entering Brightness Submap'"
	),
	{ locked = true }
)
hl.bind("SUPER + B", hl.dsp.submap("changeBrightness"), { locked = true })
