-- WINDOW RULES
-- https://wiki.hypr.land/0.55.0/Configuring/Basics/Window-Rules/

-- Float nwg-displays window
hl.window_rule({
	name = "nwg-displays-float",
	match = {
		class = "nwg-displays",
		title = "nwg-displays",
	},
	float = true,
	size = { 1200, 600 },
})

-- Open spotify workspace 4
hl.window_rule({
	name = "spotify-workspace-4",
	match = {
		class = "Spotify",
	},
	workspace = 4,
	no_initial_focus = true,
})

-- Discord workspace
hl.window_rule({
	name = "discord-workspace-5",
	match = {
		initial_title = "Discord",
	},
	workspace = 15,
	no_initial_focus = true,
})
