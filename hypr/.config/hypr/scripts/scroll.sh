#!/bin/bash
# Usage: ./scroll.sh -1 (for up) or ./scroll.sh 1 (for down)

PID_FILE="/tmp/ydotool_scroll.pid"

# Nothing can run if we want to run something else
./stop_scroll.sh

# Save this script's exact Process ID to the tmp file
echo $$ > "$PID_FILE"

# Start the scroll loop
while true; do
    ydotool mousemove -w -x 0 -y "$1"
    sleep 0.20
done
