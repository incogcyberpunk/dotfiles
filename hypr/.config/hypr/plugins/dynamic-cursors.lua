-- ╭─ Dynamic Cursors ───────────────────────────────────────────────────────╮
-- │ Adds physical cursor motion and KDE-style shake-to-find magnification. │
-- │ These values mirror upstream defaults and are safe when absent because │
-- │ the configuration is guarded by the plugin namespace below.            │
-- ╰─────────────────────────────────────────────────────────────────────────╯

-- Hyprland creates this namespace only after dynamic-cursors is loaded.
if hl.plugin.dynamic_cursors then
	hl.config({
		plugin = {
			dynamic_cursors = {
				-- ── Core behaviour ──────────────────────────────────────────────
				enabled = true,
				-- Motion model: "tilt", "rotate", "stretch", or "none".
				mode = "tilt",
				-- Smallest angle change rendered; lower is smoother but busier.
				threshold = 2,
				-- ── Rotation model ──────────────────────────────────────────────
				rotate = {
					-- Simulated cursor arm length in pixels.
					length = 20,
					-- Clockwise rotation correction in degrees.
					offset = 0.0,
				},
				-- ── Tilt model ──────────────────────────────────────────────────
				tilt = {
					-- Pointer speed in px/s that reaches the full tilt.
					limit = 5000,
					-- Aggressive curve that responds quickly at lower speeds.
					activation = "negative_quadratic",
					-- Movement sampling window in milliseconds.
					window = 100,
					-- Maximum tilt in degrees to either side.
					full = 60,
				},
				-- ── Stretch model ───────────────────────────────────────────────
				stretch = {
					-- Pointer speed in px/s that reaches twice the cursor length.
					limit = 3000,
					-- Aggressive curve that responds quickly at lower speeds.
					activation = "negative_quadratic",
					-- Movement sampling window in milliseconds.
					window = 100,
				},
				-- ── Shake to find ───────────────────────────────────────────────
				shake = {
					enabled = true,
					-- Detection sensitivity; lower values trigger sooner.
					threshold = 6.0,
					-- Initial magnification when a shake is detected.
					base = 4.0,
					-- Additional magnification gained per second of shaking.
					speed = 4.0,
					-- Contribution of shake intensity to magnification speed.
					influence = 0.0,
					-- Maximum magnification; values below 1 mean uncapped.
					limit = 0.0,
					-- Time in milliseconds to remain enlarged after shaking ends.
					timeout = 2000,
					-- Keep the active motion model visible while shaking.
					effects = false,
					-- Publish shake coordinates and zoom through Hyprland IPC.
					ipc = false,
				},
				-- ── High-resolution Hyprcursor rendering ────────────────────────
				hyprcursor = {
					-- 0: never nearest; 1: fallback only; 2: always nearest.
					nearest = 1,
					enabled = true,
					-- -1 derives resolution from normal size × shake base.
					resolution = -1,
					-- Preserve application-provided cursor shapes when possible.
					fallback = "clientside",
				},
			},
		},
	})
end
