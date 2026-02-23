#!/bin/bash
# A simple toggle for left click hold
if [ ! -f /tmp/mouse_held ]; then
    ydotool click 0x40 # Down (hex code for left button press and hold)
    touch /tmp/mouse_held
else
    ydotool click 0x80 # Up (hex code for left button release)
    rm /tmp/mouse_held
fi
