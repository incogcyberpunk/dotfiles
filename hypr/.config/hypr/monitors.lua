hl.monitor({
	output = "eDP-1",
	mode = "1920x1080",
	position = "0x0",
	scale = "1",
	bitdepth = 10,
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "1920x0",
	scale = "1",
	bitdepth = 10,
})
-- Rule for quickly plugging in random monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1" })
