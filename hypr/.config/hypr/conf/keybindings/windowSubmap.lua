hl.define_submap("windowSubmap", function()
    hl.bind("H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })

    hl.bind("LEFT", hl.dsp.window.move({ x = -25, y = 0, relative = true }), { repeating = true })
    hl.bind("DOWN", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })
    hl.bind("UP", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("RIGHT", hl.dsp.window.move({ x = 25, y = 0, relative = true }), { repeating = true })

    hl.bind("Q",
        hl.dsp.exec_cmd(
            "notify-send -t 900 -h string:x-canonical-private-synchronous:window-submap 'Exited Window Submap'"))
    hl.bind("Q", hl.dsp.submap("reset"))
    hl.bind("ESCAPE",
        hl.dsp.exec_cmd(
            "notify-send -t 900 -h string:x-canonical-private-synchronous:window-submap 'Exited Window Submap'"))
    hl.bind("ESCAPE", hl.dsp.submap("reset"))
    hl.bind("catchall",
        hl.dsp.exec_cmd(
            "notify-send -t 900 -h string:x-canonical-private-synchronous:window-submap 'Exited Window Submap' && hyprctl dispatch submap reset"))
end)

hl.bind("SUPER + R",
    hl.dsp.exec_cmd(
        "notify-send -u low -h string:x-canonical-private-synchronous:window-submap 'Entering Window Submap'"))
hl.bind("SUPER + R", hl.dsp.submap("windowSubmap"))
