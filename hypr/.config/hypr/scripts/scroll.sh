#!/bin/bash
# Usage: ./scroll.sh -1 (for up) or ./scroll.sh 1 (for down)
hyprctl dispatch submap scroll

PID_FILE="/tmp/ydotool_scroll.pid"

# Nothing can run if we want to run something else
$HOME/.config/hypr/scripts/stop_scroll.sh check

if [ "$?" == "1" ]; then
    exit 0
fi

# Save this script's exact Process ID to the tmp file
echo $$ > "$PID_FILE"

# Start the scroll loop
if [ "$1" == "-1" ]; then
    # Scroll up
    ydotool key 103:1
else
    # Scroll down
    ydotool key 108:1
    notify-send "scroll $1"
fi
exit 0
