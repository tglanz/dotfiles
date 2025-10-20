#!/bin/bash

# Set workspace rules for this profile
hyprctl keyword "workspace 1, monitor:DP-5"
hyprctl keyword "workspace 2, monitor:DP-5"
hyprctl keyword "workspace 3, monitor:DP-5"
hyprctl keyword "workspace 4, monitor:DP-5"
hyprctl keyword "workspace 5, monitor:DP-7"
hyprctl keyword "workspace 6, monitor:DP-7"
hyprctl keyword "workspace 7, monitor:DP-7"
hyprctl keyword "workspace 8, monitor:DP-7"
hyprctl keyword "workspace 9, monitor:DP-7"
hyprctl keyword "workspace 10, monitor:DP-7"

hyprctl dispatch moveworkspacetomonitor 1 DP-5
hyprctl dispatch moveworkspacetomonitor 2 DP-5
hyprctl dispatch moveworkspacetomonitor 3 DP-5
hyprctl dispatch moveworkspacetomonitor 4 DP-5
hyprctl dispatch moveworkspacetomonitor 5 DP-7
hyprctl dispatch moveworkspacetomonitor 6 DP-7
hyprctl dispatch moveworkspacetomonitor 7 DP-7
hyprctl dispatch moveworkspacetomonitor 8 DP-7
hyprctl dispatch moveworkspacetomonitor 9 DP-7
hyprctl dispatch moveworkspacetomonitor 10 DP-7

script_dir=$(dirname $0)
$script_dir/restart-waybar.sh home
