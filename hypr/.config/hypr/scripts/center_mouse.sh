#!/bin/bash

# 1. Get current monitor info
MONITOR_INFO=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')
WIDTH=$(echo "$MONITOR_INFO" | jq -r '.width')
HEIGHT=$(echo "$MONITOR_INFO" | jq -r '.height')
OFFSET_X=$(echo "$MONITOR_INFO" | jq -r '.x')
OFFSET_Y=$(echo "$MONITOR_INFO" | jq -r '.y')

# 2. Move mouse to the very top-left corner of the CURRENT monitor first
# This "clears" any hovers/tooltips in Zen Browser
hyprctl dispatch movecursor "$OFFSET_X" "$OFFSET_Y"

# 3. Tiny delay (0.05s is usually enough to trigger the event)
sleep 0.05

# 4. Calculate and move to the true center
CENTER_X=$(( OFFSET_X + (WIDTH / 2) ))
CENTER_Y=$(( OFFSET_Y + (HEIGHT / 2) ))
hyprctl dispatch movecursor "$CENTER_X" "$CENTER_Y"
