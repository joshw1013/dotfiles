#!/bin/bash

# Define the monitor descriptions (or substrings of them)
MAIN_MONITOR="AOC 24G2W1G4 ATNM31A005204"
AOC_V2="AOC 24V2W1G5 0x0000064E"
ACER="Acer Technologies V226HQL LY7AA008851N"

# Get a list of currently connected monitor descriptions from hyprctl
CONNECTED_MONITORS=$(hyprctl monitors all -j | jq -r '.[] | .description')

# Function to assign workspaces 8-15 to a target monitor
assign_secondary_workspaces() {
    local target_desc="$1"
    for i in {8..15}; do
        hyprctl keyword workspace "$i, monitor:desc:$target_desc"
    done
}

# Check which secondary monitor is plugged in
if echo "$CONNECTED_MONITORS" | grep -q "$AOC_V2"; then
    assign_secondary_workspaces "$AOC_V2"
elif echo "$CONNECTED_MONITORS" | grep -q "$ACER"; then
    assign_secondary_workspaces "$ACER"
fi

# Always ensure workspaces 1-7 stay on the main monitor
for i in {1..7}; do
    hyprctl keyword workspace "$i, monitor:desc:$MAIN_MONITOR"
done
