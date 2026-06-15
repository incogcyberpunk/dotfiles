local mainMod = "SUPER"
local HYPRSCRIPTS = "~/.config/hypr/scripts"
local sysScripts = "~/sysScripts"
local terminal = "ghostty +new-window"
local fileManager = "yazi"
local browser = "zen-browser-twilight"

-- KILL Hyprland
hl.bind("CTRL + ALT + DELETE", hl.dsp.exit(), { locked = true })

-- Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(browser .. " --blank-window"))
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(terminal .. " -e " .. fileManager))

-- Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))

-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())

-- Actions
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/toggleAnimations.sh"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(sysScripts .. "/interactiveCd.sh"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/reloadWaybar.sh"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/toggleWaybar.sh"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload && notify-send 'Reloaded Hyprland Config'"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist delete"))

-- Move Focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move Window
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.swap({ direction = "right" }))

-- Locked binds (work when screen is locked)
hl.bind("ALT + L", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/lockscreen.sh"), { locked = true })
hl.bind("ALT + S", hl.dsp.exec_cmd(HYPRSCRIPTS .. "/suspend.sh"), { locked = true })

-- Wlogout
hl.bind("ALT + M", hl.dsp.exec_cmd("wlogout -s"))

-- Universal Submap Reset
hl.bind(mainMod .. " + ALT + R", function()
	hl.dispatch(hl.dsp.exec_cmd("swaync-client -C")) -- Close all notifications
	hl.dispatch(
		hl.dsp.exec_cmd(
			"notify-send -h string:x-canonical-private-synchronous:resetUniversal 'Performed Universal Submap Reset'"
		)
	)
	hl.dispatch(hl.dsp.submap("reset"))
end, { locked = true, submap_universal = true })
