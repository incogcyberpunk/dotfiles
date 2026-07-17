local mainMod = "SUPER"
local scripts = "~/.config/hypr/scripts"

hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("waypaper --random"))
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("waypaper --restore"))

hl.bind("SUPER + ALT + CTRL + L", hl.dsp.exec_cmd(scripts .. "/laptopDisplayEnable.sh"))
hl.bind("SUPER + ALT + CTRL + M", hl.dsp.exec_cmd(scripts .. "/monitorDisplayEnable.sh"))
hl.bind("SUPER + ALT + CTRL + B", hl.dsp.exec_cmd(scripts .. "/bothDisplaysEnable.sh"))

hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + D", hl.dsp.window.move({ workspace = "+0" }))
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + D", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t"))

hl.bind("ALT + H", hl.dsp.exec_cmd(scripts .. "/hypridle.sh toggle"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("rofimoji"))

-- Add bind for vim-mode script
hl.bind("CTRL + Control_R", hl.dsp.exec_cmd("~/sysScripts/vimMode/vim-mode-toggle.sh"), { release = true })
