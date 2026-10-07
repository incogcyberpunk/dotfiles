local mainMod = "SUPER"
local shot = "~/.config/hypr/scripts/screenshot.sh "

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(shot .. "area"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(shot .. "monitor"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(shot .. "ocr"))
