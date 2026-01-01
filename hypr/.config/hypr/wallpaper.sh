#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/wallpapers/"
STATE_FILE="/tmp/current_wallpaper"
CURRENT_WALL=$(cat "$STATE_FILE" 2>/dev/null)
# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
# Save and apply
echo "$WALLPAPER" > "$STATE_FILE"
hyprctl hyprpaper wallpaper ", $WALLPAPER"
