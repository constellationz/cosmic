#!/usr/bin/bash
# Dump last screenshot from /tmp/screenshot.png

if ! [ -a /tmp/screenshot.png ]; then
	notify-send -u critical "No screenshot to dump"
	exit
fi

TO="`xdg-user-dir DESKTOP`/`date -u +%Y_%m_%d_%H_%M_%S_%N`.png"

cp /tmp/screenshot.png "$TO"

notify-send "Dumped last screenshot to $TO"
