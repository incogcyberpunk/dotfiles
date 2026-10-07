-- Keep battery-profile animation savings across config reloads.
-- The flag is managed by ~/.local/bin/battery-profile-notify and cleared by
-- scripts/toggleAnimations.sh, so a manual SUPER+SHIFT+A toggle always wins.
local runtime = os.getenv("XDG_RUNTIME_DIR")
local flag = runtime and io.open(runtime .. "/battery-profile-user/animations-disabled", "r")
if flag then
    flag:close()
    hl.config({ animations = { enabled = false }, decoration = { blur = { enabled = false } } })
end
