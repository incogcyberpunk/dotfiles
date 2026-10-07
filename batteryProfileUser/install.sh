#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "$0")" && pwd)

install -D -m 0755 "$ROOT/.local/bin/battery-hypridle" "$HOME/.local/bin/battery-hypridle"
install -D -m 0755 "$ROOT/.local/bin/battery-profile-notify" "$HOME/.local/bin/battery-profile-notify"
install -D -m 0755 "$ROOT/.local/bin/configure-battery-browsers" "$HOME/.local/bin/configure-battery-browsers"
install -D -m 0644 "$ROOT/.local/share/battery-profile/hypridle-battery.conf" "$HOME/.local/share/battery-profile/hypridle-battery.conf"

SYSTEMD_SOURCE=$(cd -- "$ROOT/../userSystemd/.config/systemd/user" && pwd)
install -D -m 0644 "$SYSTEMD_SOURCE/battery-profile-notify.service" "$HOME/.config/systemd/user/battery-profile-notify.service"
install -D -m 0644 "$SYSTEMD_SOURCE/hypridle.service.d/battery-profile.conf" "$HOME/.config/systemd/user/hypridle.service.d/battery-profile.conf"

AUTOSTART=${XDG_CONFIG_HOME:-$HOME/.config}/hypr/conf/autostart.lua
if [[ -f $AUTOSTART ]]; then
    python - "$AUTOSTART" <<'PY'
from pathlib import Path
import sys
path = Path(sys.argv[1])
text = path.read_text()
old = 'hl.exec_cmd("hypridle")'
new = 'hl.exec_cmd("systemctl --user start hypridle.service")'
if old in text:
    path.write_text(text.replace(old, new, 1))
elif new not in text:
    raise SystemExit(f"Could not locate Hypridle autostart in {path}")
PY
fi

# Hyprland: keep battery animation savings across config reloads, and let the
# SUPER+SHIFT+A toggle take ownership. Patches are idempotent.
HYPR=${XDG_CONFIG_HOME:-$HOME/.config}/hypr
HYPR_SOURCE=$(cd -- "$ROOT/../hypr/.config/hypr" && pwd)
if [[ -f $HYPR/hyprland.lua ]]; then
    install -D -m 0644 "$HYPR_SOURCE/conf/batteryProfile.lua" "$HYPR/conf/batteryProfile.lua"
    grep -q 'require("conf.batteryProfile")' "$HYPR/hyprland.lua" ||
        printf '\n-- Battery profile overrides (must load last)\nrequire("conf.batteryProfile")\n' >>"$HYPR/hyprland.lua"
fi
TOGGLE=$HYPR/scripts/toggleAnimations.sh
if [[ -f $TOGGLE ]] && ! grep -q 'battery-profile-user/animations-disabled' "$TOGGLE"; then
    python - "$TOGGLE" <<'PY'
from pathlib import Path
import sys
path = Path(sys.argv[1])
lines = path.read_text().splitlines(keepends=True)
insert = [
    "\n",
    "# A manual toggle takes ownership from the automatic battery profile.\n",
    'rm -f "${XDG_RUNTIME_DIR:-/run/user/$UID}/battery-profile-user/animations-disabled"\n',
]
at = 1 if lines and lines[0].startswith("#!") else 0
path.write_text("".join(lines[:at] + insert + lines[at:]))
PY
fi

"$HOME/.local/bin/battery-profile-notify" self-test
"$HOME/.local/bin/configure-battery-browsers"
systemctl --user daemon-reload
pkill -x hypridle 2>/dev/null || true
systemctl --user enable --now hypridle.service
systemctl --user enable battery-profile-notify.service
systemctl --user restart battery-profile-notify.service

printf '%s\n' 'Installed user profile. Zen policy/extension activates after Zen restarts.'
systemctl --user --no-pager status hypridle.service battery-profile-notify.service
