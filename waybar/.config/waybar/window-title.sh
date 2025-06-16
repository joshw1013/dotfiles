#!/bin/sh

# Get the JSON output from hyprctl
active_window_json=$(hyprctl activewindow -j)

# Check if the active window JSON contains a title
if echo "$active_window_json" | jq -e '.title' > /dev/null; then
    # --- This part runs when a window IS active ---
    title=$(echo "$active_window_json" | jq -r '.title')
    echo "{\"text\": \"$title\", \"class\": \"focused\"}"
else
    # --- This part runs when the workspace is EMPTY ---
    echo "{\"text\": \"Desktop\", \"class\": \"empty\"}"
fi
