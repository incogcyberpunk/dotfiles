local scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(scripts .. "/suspend.sh"), { locked = true })
