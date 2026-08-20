-- GESTURES
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

local HYPRSCRIPTS = "~/.config/hypr/scripts"

-- ║ 3-Finger Swipe Gestures — Workspace Navigation                 ║

-- Swipe left/right to switch workspaces (1:1 animated)
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Swipe up to
-- hl.gesture({
--     fingers = 3,
--     direction = "up",
--     action = function()
--         hl.exec_cmd("pkill rofi || rofi -show drun")
--     end,
-- })

-- Swipe down to
-- hl.gesture({
--     fingers = 3,
--     direction = "down",
--     action = function()
--         hl.exec_cmd("swaync-client -t")
--     end,
-- })

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║ 4-Finger Swipe Gestures — Window Management                      ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- Swipe up to fullscreen active window
hl.gesture({
	fingers = 4,
	direction = "up",
	action = "fullscreen",
})

-- Swipe down to maximize (keeps bar visible)
-- hl.gesture({
-- 	fingers = 4,
-- 	direction = "down",
-- 	action = "fullscreen",
-- 	mode = "maximize",
-- })

-- Swipe left/right to move window between workspaces
hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "move",
})

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║ 4-Finger + Modifier — Special Workspaces & Actions               ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- SUPER + 4-finger swipe down to toggle scratchpad
hl.gesture({
	fingers = 4,
	direction = "down",
	mods = "SUPER",
	action = "special",
	workspace_name = "magic",
})

-- SUPER + 4-finger swipe up to float/tile toggle
hl.gesture({
	fingers = 4,
	direction = "up",
	mods = "SUPER",
	action = "float",
})

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║ Pinch Gestures — Zoom & Resize                                 ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- 2-finger pinch for live cursor zoom (smooth, continuous)
hl.gesture({
	fingers = 2,
	direction = "pinch",
	action = "cursor_zoom",
	zoom_level = 1,
	mode = "live",
})

-- 3-finger pinch in/out to resize active window
hl.gesture({
	fingers = 3,
	direction = "pinch",
	action = "resize",
})

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║ Live Gestures — Volume Control                                  ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- 4-finger vertical swipe with ALT to adjust volume (live feedback)
local function adjust_volume(change)
	local amount = math.abs(change)
	if amount < 0.1 then
		return
	end
	local direction = change < 0 and "-" or "+"
	hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. string.format("%.0f", amount) .. "%" .. direction)
end

hl.gesture({
	fingers = 4,
	direction = "vertical",
	mods = "ALT",
	action = {
		start = function(e)
			adjust_volume(-2 * e.delta.y)
		end,
		update = function(e)
			adjust_volume(-2 * e.delta.y)
		end,
	},
})

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║ Live Gestures — Brightness Control                              ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- 3-finger vertical swipe with SUPER to adjust brightness
local function adjust_brightness(change)
	local amount = math.abs(change)
	if amount < 0.2 then
		return
	end
	local direction = change < 0 and "-" or "+"
	hl.exec_cmd(HYPRSCRIPTS .. "/changeBrightness.sh " .. string.format("%.0f", amount) .. direction)
end

hl.gesture({
	fingers = 3,
	direction = "vertical",
	mods = "SUPER",
	action = {
		start = function(e)
			adjust_brightness(-1.5 * e.delta.y)
		end,
		update = function(e)
			adjust_brightness(-1.5 * e.delta.y)
		end,
	},
})
