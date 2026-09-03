-- AUTOSTART
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Using `hl.on` to define an event listener for the event `hyprland.start`
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")

	-- Publish this Hyprland instance's signature into the persistent tmux server.
	-- The tmux server is spawned by tmuxSetup.service (a systemd user service under
	-- default.target), so it comes up independently of Hyprland and never inherits
	-- HYPRLAND_INSTANCE_SIGNATURE. Without it, `hyprctl` from any tmux pane fails
	-- with "HYPRLAND_INSTANCE_SIGNATURE not set". Pushing it into the server's global
	-- env lets new panes talk to hyprctl. $HYPRLAND_INSTANCE_SIGNATURE here is
	-- Hyprland's own env, so it is always the current, live instance.
	hl.exec_cmd('tmux set-environment -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"')

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

	-- Attach a terminal to the Configs tmux session (built by tmuxSetup.service).
	hl.exec_cmd("ghostty --class=dev.incog.tmux -e tmux attach -t Configs")

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
	-- Remove the signature from the tmux server before Hyprland exits. The tmux
	-- server outlives Hyprland (kept alive so sessions stay attachable over SSH when
	-- only multi-user.target is up), so a leftover signature would be stale and point
	-- at a dead socket, making `hyprctl` in headless sessions fail confusingly.
	-- Clearing it here keeps the server's env honest: set only while Hyprland runs.
	os.execute("tmux set-environment -gu HYPRLAND_INSTANCE_SIGNATURE")
	os.execute("systemctl --user stop hyprland-session.target")
end)
