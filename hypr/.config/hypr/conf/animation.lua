-- Springs ignore `speed` (physics-timed) but it must still be > 0.
-- ζ = dampening / (2·√stiffness)  (mass = 1)

hl.curve("snap", { type = "spring", mass = 1, stiffness = 400, dampening = 38 }) -- ζ≈0.95, no visible overshoot
hl.curve("pop",  { type = "spring", mass = 1, stiffness = 300, dampening = 26 }) -- ζ≈0.75, faster rise, tiny pop

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInCubic",  { type = "bezier", points = { { 0.32, 0 }, { 0.67, 0 } } })
hl.curve("linear",       { type = "bezier", points = { { 0, 0 },    { 1, 1 } } })

hl.animation({ leaf = "global",           enabled = true, speed = 3,   bezier = "easeOutQuint" })

-- windows: spring in, fast ease-in out (exits shorter than entrances)
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3,   spring = "pop",  style = "popin 85%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.2, bezier = "easeInCubic", style = "popin 90%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3,   spring = "snap", style = "slide" })

-- fades (fade covers switch/dim/shadow/layers-in/popups via inheritance)
hl.animation({ leaf = "fade",             enabled = true, speed = 1.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 1.2, bezier = "linear" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 1,   bezier = "linear" })

-- layers: rofi, swaync, waybar popups
hl.animation({ leaf = "layersIn",         enabled = true, speed = 2,   spring = "snap", style = "popin 92%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1,   bezier = "easeInCubic", style = "fade" })

-- border: keep borderangle on "once"; "loop" redraws every frame and costs battery
hl.animation({ leaf = "border",           enabled = true, speed = 2,   bezier = "easeOutQuint" })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 30,  bezier = "linear" })

-- workspaces: horizontal slide matches the 3-finger swipe; scratchpad slides vertically
hl.animation({ leaf = "workspaces",       enabled = true, speed = 3,   spring = "snap", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3,   spring = "snap", style = "slidevert" })

-- SUPER + pinch zoom
hl.animation({ leaf = "zoomFactor",       enabled = true, speed = 2,   bezier = "easeOutQuint" })
