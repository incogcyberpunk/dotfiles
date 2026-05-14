local scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

hl.bind("F2", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh decrease"), { locked = true, repeating = true })
hl.bind("F3", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh increase"), { locked = true, repeating = true })

hl.bind("F1", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-sink"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-sink"), { locked = true })

hl.bind("F4", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-source"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scripts .. "/changeAudio.sh toggle-source"), { locked = true })

hl.bind("F6", hl.dsp.exec_cmd(scripts .. "/changeBrightness.sh increase"), { locked = true, repeating = true })
hl.bind("F5", hl.dsp.exec_cmd(scripts .. "/changeBrightness.sh decrease"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scripts .. "/changeBrightness.sh increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "/changeBrightness.sh decrease"), { locked = true, repeating = true })

hl.bind("F8", hl.dsp.exec_cmd(scripts .. "/lockscreen.sh"), { locked = true })
hl.bind("XF86ScreenSaver", hl.dsp.exec_cmd(scripts .. "/lockscreen.sh"), { locked = true })

hl.bind("F9", hl.dsp.exec_cmd(scripts .. "/toggleFlightMode.sh"), { locked = true })
hl.bind("XF86RFKill", hl.dsp.exec_cmd(scripts .. "/toggleFlightMode.sh"), { locked = true })

hl.bind("code:76", hl.dsp.exec_cmd(scripts .. "/toggleTouchpad.sh"), { locked = true })
