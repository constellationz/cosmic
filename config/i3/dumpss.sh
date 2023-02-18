#!/usr/bin/bash
# Dump last screenshot from /tmp/screenshot.png
# Notify user when screenshot is dumped or if not possible

SSDIR="`xdg-user-dir DESKTOP`/Screenshots"
SSNAME="`date -u +%Y_%m_%d_%H_%M_%S_%N`.png"

mkdir -p $SSDIR

# If there is no previous screenshot, warn user and exit
if ! [ -a /tmp/screenshot.png ]; then
	notify-send -u critical "No screenshot to dump"
	exit
fi

TO="$SSDIR/$SSNAME"

cp /tmp/screenshot.png "$TO"

notify-send "Dumped last screenshot to $TO"

# Remove screenshot that was just dumped
rm /tmp/screenshot.png
