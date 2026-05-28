local scripts = "~/.config/hypr/scripts"

hl.define_submap("audioSubmap", function()
	hl.bind("T", hl.dsp.exec_cmd("~/sysScripts/toggleAppSound.sh"))

	hl.bind("H", hl.dsp.exec_cmd("playerctl -p spotify previous"), { repeating = true })
	hl.bind("J", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh decrease"), { repeating = true })
	hl.bind("K", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh increase"), { repeating = true })
	hl.bind("L", hl.dsp.exec_cmd("playerctl -p spotify next"), { repeating = true })

	hl.bind("LEFT", hl.dsp.exec_cmd("playerctl -p spotify previous"), { repeating = true })
	hl.bind("DOWN", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh decrease"), { repeating = true })
	hl.bind("UP", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh increase"), { repeating = true })
	hl.bind("RIGHT", hl.dsp.exec_cmd("playerctl -p spotify next"), { repeating = true })

	hl.bind("M", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-sink"), { locked = true })
	hl.bind("SPACE", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })

	hl.bind("P", hl.dsp.exec_cmd(scripts .. "/spotify.sh", { workspace = "4 silent" }))

	hl.bind(
		"Q",
		hl.dsp.exec_cmd(
			"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Audio Submap'"
		),
		{ locked = true }
	)
	hl.bind("Q", hl.dsp.submap("reset"), { locked = true })
	hl.bind(
		"ESCAPE",
		hl.dsp.exec_cmd(
			"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Audio Submap'"
		),
		{ locked = true }
	)
	hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
	hl.bind(
		"catchall",
		hl.dsp.exec_cmd(
			"notify-send -t 900 -h string:x-canonical-private-synchronous:audio-submap 'Exited Audio Submap' && hyprctl dispatch submap reset"
		),
		{ locked = true }
	)
	hl.bind("catchall", hl.dsp.submap("reset"), { locked = true })
end)

hl.bind(
	"SUPER + S",
	hl.dsp.exec_cmd("notify-send -u critical -h string:x-canonical-private-synchronous:audio-submap 'Audio Submap ON'"),
	{ locked = true }
)
hl.bind("SUPER + S", hl.dsp.submap("audioSubmap"), { locked = true })
