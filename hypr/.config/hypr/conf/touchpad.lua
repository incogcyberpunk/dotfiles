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
            drag_3fg = 0 -- off: 3fg drag swallows the 3-finger swipe/pinch gestures
        }
    }
})

hl.device({
    name = 'elan0524:01-04f3:3215-touchpad',
    enabled = true,
})
