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
