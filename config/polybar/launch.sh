#!/usr/bin/bash

# Message existing bars to exit
polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/polybar.log
MONITOR=HDMI-1 polybar example >&1 | tee -a /tmp/polybar.log & disown

echo "Launched polybar"
