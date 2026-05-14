hl.bind("ALT + SPACE", hl.dsp.exec_cmd("playerctl -a pause"), { locked = true })
hl.bind("CTRL + ALT + SPACE", hl.dsp.exec_cmd("playerctl play-pause -i spotify"), { locked = true })
hl.bind("CTRL + ALT + RIGHT", hl.dsp.exec_cmd("playerctl next -i spotify"), { locked = true })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("playerctl next -i spotify"), { locked = true })
hl.bind("CTRL + ALT + LEFT", hl.dsp.exec_cmd("playerctl previous -i spotify"), { locked = true })
hl.bind("CTRL + ALT + H", hl.dsp.exec_cmd("playerctl previous -i spotify"), { locked = true })

hl.bind("SHIFT + ALT + SPACE", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })
