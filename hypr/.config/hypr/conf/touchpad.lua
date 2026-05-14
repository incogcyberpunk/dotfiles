hl.config({
    input = {
        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            middle_button_emulation = true,
            scroll_factor = 1.0,
            drag_lock = 0,
            drag_3fg = 1
        }
    }
})

hl.device({
    name = 'elan0524:01-04f3:3215-touchpad',
    enabled = true,
})
