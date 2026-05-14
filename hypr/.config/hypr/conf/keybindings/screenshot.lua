local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp -d)\" -l 3 - | satty -f -"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("grim -l 3 - | satty -f -"))
