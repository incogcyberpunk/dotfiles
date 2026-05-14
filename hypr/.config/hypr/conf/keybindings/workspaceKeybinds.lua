local mainMod = "SUPER"
local altMod = "ALT"
local scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.exec_cmd(scripts .. "/moveAllWindows.sh " .. i))
end

for i = 11, 20 do
    local key = i % 10
    hl.bind(altMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(altMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(altMod .. " + CTRL + " .. key, hl.dsp.exec_cmd(scripts .. "/moveAllWindows.sh " .. i))
end

hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
