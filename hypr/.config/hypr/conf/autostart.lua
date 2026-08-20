-- AUTOSTART
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Using `hl.on` to define an event listener for the event `hyprland.start`
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")

	-- Using awww(wayland wallpaper daemon)
	hl.exec_cmd("awww-daemon")

	-- Startup waybar on startup
	hl.exec_cmd("waybar")

	-- Udiskie
	hl.exec_cmd("udiskie")

	-- Load Notification Daemon
	hl.exec_cmd("swaync")

	-- Equibop
	hl.exec_cmd("equibop")

	-- Launch hyprsunset and hypridle
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hypridle")

	-- Setup cliphist to store images and text
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- Execute the tmux script
	hl.exec_cmd("~/.config/hypr/scripts/tmuxSetup")

	-- Load the nepali date
	hl.exec_cmd("~/sysScripts/fetchNepaliDate.sh")
end)

hl.on("workspace.move_to_monitor", function(ws, m)
	hl.notification.create({
		text = "Workspace: " .. ws.name .. " moved to a monitor at x: " .. m.position.x,
		timeout = 4000,
		icon = "ok",
	})
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target")
end)
