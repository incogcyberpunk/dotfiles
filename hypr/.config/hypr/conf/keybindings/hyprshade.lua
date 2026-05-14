local mainMod = "SUPER"

hl.bind(mainMod .. " + CTRL + UP", hl.dsp.exec_cmd("hyprshade on blue-light-filter-75"))
hl.bind(mainMod .. " + CTRL + DOWN", hl.dsp.exec_cmd("hyprshade off"))
