--   _   _                  _                 _
--  | | | |_   _ _ __  _ __| | __ _ _ __   __| |
--  | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
--  |  _  | |_| | |_) | |  | | (_| | | | | (_| |
--  |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--         |___/|_|

-- Monitor
require("monitors")

-- Workspace Rules
require("workspaces")

-- Cursor
require("conf.cursor")

-- Touchpad
require("conf.touchpad")

-- Environment
require("conf.environment")

-- Autostart
require("conf.autostart")

-- Load configuration files
require("conf.decoration")
require("conf.variables")
require("conf.layout")
require("conf.misc")
require("conf.windowrule")
require("conf.keybindings.appKeybinds")
require("conf.keybindings.audioKeybinds")
require("conf.keybindings.audioSubmap")
require("conf.keybindings.brightnessSubmap")
require("conf.keybindings.default")
require("conf.keybindings.disableKeybinds")
require("conf.keybindings.fnKeybinds")
require("conf.keybindings.hyprshade")
require("conf.keybindings.laptopLid")
require("conf.keybindings.screenshot")
require("conf.keybindings.utilites")
require("conf.keybindings.windowSubmap")
require("conf.keybindings.workspaceKeybinds")

-- Load animations
require("conf.animation")

-- Permissions
require("conf.permissions")

-- Gestures
require("conf.gestures")
