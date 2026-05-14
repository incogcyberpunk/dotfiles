hl.config({
    ecosystem = {
        enforce_permissions = true,
    }
})

hl.permission({ binary = "/usr/bin/*", type = 'screencopy', mode = 'ask' })
hl.permission({ binary = "/usr/bin/*", type = 'keyboard', mode = 'ask' })
hl.permission({ binary = "/run/media/*", type = 'keyboard', mode = 'ask' })
hl.permission({ binary = "~/.local/bin/*", type = 'screencopy', mode = 'ask' })
hl.permission({ binary = "~/.local/bin/*", type = 'keyboard', mode = 'ask' })
hl.permission({ binary = "/usr/bin/grim", type = 'screencopy', mode = 'allow' })
hl.permission({ binary = "/usr/bin/obs", type = 'screencopy', mode = 'allow' })
-- hl.permission({binary = "/usr/bin/hyprlock", type= 'screencopy',mode = 'allow'})
hl.permission({ binary = "/usr/bin/discord", type = 'screencopy', mode = 'ask' })
hl.permission({ binary = "/usr/bin/zen-browser", type = 'screencopy', mode = 'ask' })
