#!/usr/bin/bash
# Screenshot a window and add a drop shadow effect
# Places file in /tmp/screenshot.png
# Copies file to clipboard
# Notifies user

maim --hidecursor -st 9999999 | convert - \
	-bordercolor "#22222233" -border 2x2 \
	\( -clone 0 -background "#00000099" -shadow 20x20+5+5 \) \
	-reverse -background none -layers merge +repage \
	/tmp/screenshot.png

cat /tmp/screenshot.png | xclip -selection clipboard -t image/png

notify-send "Copied screenshot to clipboard"
