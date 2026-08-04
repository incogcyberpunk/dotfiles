hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = "1",
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "1920x0",
	scale = "1",
})
-- Rule for quickly plugging in random monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1" })
