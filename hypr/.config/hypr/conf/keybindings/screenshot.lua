local mainMod = "SUPER"
local shot = "~/.config/hypr/scripts/screenshot.sh "

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(shot .. "area"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(shot .. "full"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(shot .. "window"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(shot .. "monitor"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(shot .. "copy"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(shot .. "ocr"))
