#!/usr/bin/bash
# Configure inputs for i3

# Get mouse id to change
MOUSEID=$(xinput | grep "Logitech G305" | grep "pointer" | sed -E 's/.*id=([0-9]*).*$/\1/')
echo $MOUSEID

# Set mouse sensitivity
# Use `xinput` to list input devices
xinput --set-prop $MOUSEID 'libinput Accel Speed' -1

# Keyboard repeat rate
xset r rate 200 30
