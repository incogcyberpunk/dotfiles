local scripts = "~/.config/hypr/scripts"

hl.define_submap("audioSubmap", function()
	-- Toggle the current application's sink volume
	hl.bind("T", hl.dsp.exec_cmd("~/sysScripts/toggleAppSound.sh"))

	-- Open spotify
	hl.bind("P", hl.dsp.exec_cmd(scripts .. "/spotify.sh"))

	-- Spotify Binds
	hl.bind("H", hl.dsp.exec_cmd("playerctl -p spotify previous"), { repeating = true, locked = true })
	hl.bind("J", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh decrease"), { repeating = true })
	hl.bind("K", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh increase"), { repeating = true })
	hl.bind("L", hl.dsp.exec_cmd("playerctl -p spotify next"), { repeating = true, locked = true })

	hl.bind("LEFT", hl.dsp.exec_cmd("playerctl -p spotify previous"), { repeating = true })
	hl.bind("DOWN", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh decrease"), { repeating = true })
	hl.bind("UP", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh increase"), { repeating = true })
	hl.bind("RIGHT", hl.dsp.exec_cmd("playerctl -p spotify next"), { repeating = true })

	-- Binds to toggle sink and source volumes
	hl.bind("A", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-sink"), { locked = true })
	hl.bind("M", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-source"), { locked = true })

	-- Binds to toggle play/pause for Spotify
	hl.bind("SPACE", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })


	-- Exit submap with Q or ESCAPE
	hl.bind("Q", function()
		hl.dispatch(
			hl.dsp.exec_cmd(
				"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Audio Submap' "
			)
		)
		hl.dispatch(hl.dsp.submap("reset"))
	end, { locked = true })
	hl.bind("ESCAPE", function()
		hl.dispatch(
			hl.dsp.exec_cmd(
				"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Audio Submap' "
			)
		)
		hl.dispatch(hl.dsp.submap("reset"))
	end, { locked = true })
	-- hl.bind("catchall", function()
	-- 	hl.dispatch(
	-- 		hl.dsp.exec_cmd(
	-- 			"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Audio Submap' "
	-- 		)
	-- 	)
	-- 	hl.dispatch(hl.dsp.submap("reset"))
	-- end, { locked = true })
end)

hl.bind(
	"SUPER + S",
	hl.dsp.exec_cmd("notify-send -u critical -h string:x-canonical-private-synchronous:audio-submap 'Audio Submap ON'"),
	{ locked = true }
)
hl.bind("SUPER + S", hl.dsp.submap("audioSubmap"), { locked = true })
