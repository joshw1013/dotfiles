#!/bin/bash

# Get info about the currently focused monitor
MONITOR_INFO=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')

# Extract width, height, and offset (x, y)
WIDTH=$(echo "$MONITOR_INFO" | jq -r '.width')
HEIGHT=$(echo "$MONITOR_INFO" | jq -r '.height')
OFFSET_X=$(echo "$MONITOR_INFO" | jq -r '.x')
OFFSET_Y=$(echo "$MONITOR_INFO" | jq -r '.y')

# Calculate the center
CENTER_X=$(( OFFSET_X + (WIDTH / 2) ))
CENTER_Y=$(( OFFSET_Y + (HEIGHT / 2) ))

# Move the cursor
hyprctl dispatch movecursor "$CENTER_X" "$CENTER_Y"
