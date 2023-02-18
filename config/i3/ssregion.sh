#!/usr/bin/bash
# Screenshot a region
# Saves screenshot to /tmp/screenshot.png
# Notifies user

maim -s --hidecursor > /tmp/screenshot.png

cat /tmp/screenshot.png | xclip -selection clipboard -t image/png

notify-send "Copied screenshot to clipboard"
