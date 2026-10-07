#!/usr/bin/env bash
set -euo pipefail

if (( EUID != 0 )); then
    printf 'Run as root: sudo %q\n' "$0" >&2
    exit 1
fi

ROOT=$(cd -- "$(dirname -- "$0")" && pwd)
BACKUP=/var/backups/battery-profile/$(date +%Y%m%d-%H%M%S)

backup_if_present() {
    local target=$1 relative=${1#/}
    [[ -e $target || -L $target ]] || return 0
    install -d "$BACKUP/$(dirname "$relative")"
    cp -a -- "$target" "$BACKUP/$relative"
}

install_file() {
    local mode=$1 source=$2 target=$3
    backup_if_present "$target"
    install -D -m "$mode" "$ROOT/$source" "$target"
}

printf '%s  %s\n' \
  '77e7a630e3ab378440c3924e57450db88bf262803608b1a47430f3cc8c5294f6' \
  "$ROOT/usr/local/share/battery-profile/auto_tab_discard-0.7.5.xpi" | sha256sum --check

install_file 0755 usr/local/libexec/battery-profile /usr/local/libexec/battery-profile
install_file 0644 etc/systemd/system/battery-profile.service /etc/systemd/system/battery-profile.service
install_file 0644 etc/systemd/system/battery-profile-wifi.service /etc/systemd/system/battery-profile-wifi.service
install_file 0644 etc/systemd/system/iwd.service.d/battery-profile.conf /etc/systemd/system/iwd.service.d/battery-profile.conf
install_file 0644 etc/systemd/system/NetworkManager.service.d/battery-profile.conf /etc/systemd/system/NetworkManager.service.d/battery-profile.conf
install_file 0644 etc/udev/rules.d/80-battery-profile-wifi.rules /etc/udev/rules.d/80-battery-profile-wifi.rules
install_file 0644 etc/iwd/main.conf /etc/iwd/main.conf
install_file 0644 etc/NetworkManager/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
install_file 0644 etc/auto-cpufreq.conf /etc/auto-cpufreq.conf
install_file 0644 usr/local/share/doc/battery-profile/README.md /usr/local/share/doc/battery-profile/README.md
install_file 0644 usr/local/share/battery-profile/auto_tab_discard-0.7.5.xpi /usr/local/share/battery-profile/auto_tab_discard-0.7.5.xpi
# /etc/zen/policies is read instead of the package-owned distribution file, so
# zen-browser-bin updates cannot overwrite it. It keeps the package's own policies.
install_file 0644 etc/zen/policies/policies.json /etc/zen/policies/policies.json

systemd-analyze verify /etc/systemd/system/battery-profile.service /etc/systemd/system/battery-profile-wifi.service
/usr/local/libexec/battery-profile self-test
systemctl daemon-reload
udevadm control --reload
systemctl restart auto-cpufreq.service
systemctl enable --now battery-profile.service
/usr/local/libexec/battery-profile apply-current

printf 'Installed root profile. Backups (when needed): %s\n' "$BACKUP"
/usr/local/libexec/battery-profile status
