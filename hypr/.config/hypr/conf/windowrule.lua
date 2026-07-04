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
	rounding = 15,
	border_color = "#89b4fa",
})

-- Open the tmuxSetup script in workspace 3 silently
hl.window_rule({
	name = "tmuxSetup-workspace-3",
	match = {
		class = "dev.incog.tmux",
	},
	workspace = 3,
	no_initial_focus = true,
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

-- Open discord workspace 15
hl.window_rule({
	name = "discord-workspace-5",
	match = {
		class = "vesktop",
	},
	workspace = 15,
	no_initial_focus = true,
})

-- Open pwvucontrol in float
hl.window_rule({
	name = "pwvucontrol-float",
	match = {
		class = "com.saivert.pwvucontrol",
	},
	float = true,
	size = { 900, 400 },
	rounding = 15,
	border_color = "#89b4fa",
})
