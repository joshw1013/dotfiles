#!/bin/bash
# Usage: ./stop_scroll.sh -1 (for up) or ./stop_scroll.sh 1 (for down)

PID_FILE="/tmp/ydotool_scroll.pid"

# If the PID file exists, kill the exact process and remove the file
if [ -f "$PID_FILE" ]; then
    kill $(cat "$PID_FILE") 2>/dev/null
    rm "$PID_FILE"
fi
