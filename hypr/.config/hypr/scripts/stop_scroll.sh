#!/bin/bash
# Usage: ./stop_scroll.sh

PID_FILE="/tmp/ydotool_scroll.pid"
hyprctl dispatch submap cursor

# If the PID file exists, kill the exact process and remove the file
if [ -f "$PID_FILE" ]; then
    rm "$PID_FILE"
    # Kill both we don't really care about false positives
    ydotool key 103:0
    ydotool key 108:0
    notify-send "Kill $1"
    if [ "$1" == "check" ]; then
        exit 1
    fi
    exit 0
fi
