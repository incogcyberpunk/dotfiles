# Automatic battery-saving profile

The implementation is split into two packages:

- `batteryProfileRoot/`: privileged UPower controller, Wi-Fi hooks, CPU/network settings, and Zen enterprise policy (`/etc/zen/policies`, safe from package updates).
- `batteryProfileUser/`: Hypridle selector, desktop notifier, and browser preference setup.

Install the user layer first:

```sh
./batteryProfileUser/install.sh
```

Install the root layer with administrative privileges:

```sh
sudo ./batteryProfileRoot/install.sh
```

No periodic timer is used. UPower handles AC transitions; systemd/udev hooks
reapply Wi-Fi policy after manager/interface recreation.

Useful checks:

```sh
battery-profile status
battery-profile dry-run battery
battery-profile dry-run ac
systemctl status battery-profile.service
systemctl --user status battery-profile-notify.service hypridle.service
```

Restart Zen once after root installation to activate the pinned Auto Tab Discard
0.7.5 extension and managed battery-only settings. Brave preferences are applied
to standard Brave only; Brave Origin's Messenger profile is left untouched.

## Animations

On battery, the notifier turns off Hyprland animations and blur (the same calls
as `SUPER+SHIFT+A`, without its 10% dimming) only if they are currently on, and
turns them back on at AC only if it was the one that turned them off.
`hypr/conf/batteryProfile.lua` keeps them off across config reloads while on
battery. Pressing `SUPER+SHIFT+A` hands control back to you until the next
unplug.
