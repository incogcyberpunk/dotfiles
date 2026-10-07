# Automatic battery profile

`battery-profile.service` monitors UPower transitions and applies only safe,
reversible controls. Runtime restoration state is stored in
`/run/battery-profile` and resets naturally at boot.

Commands:

```sh
battery-profile status
battery-profile dry-run battery
battery-profile dry-run ac
battery-profile apply-current
battery-profile self-test
```

The policy never modifies SSH, stops active containers/VMs/print jobs, forces
storage power states, changes Thunderbolt authorization, or enables unsafe
PCIe/i915/NVMe options.

Wi-Fi policy is applied directly through `iw`, independently of iwd or
NetworkManager. Both managers are configured not to override it.
