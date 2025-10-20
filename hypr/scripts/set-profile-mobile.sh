#!/bin/bash

hyprctl keyword "monitor eDP-1,1920x1200@60,0x0,1"
hyprctl keyword "general:border_size 1"

# Set workspace rules for this profile
hyprctl keyword "workspace 1, monitor:eDP-1"
hyprctl keyword "workspace 2, monitor:eDP-1"
hyprctl keyword "workspace 3, monitor:eDP-1"
hyprctl keyword "workspace 4, monitor:eDP-1"
hyprctl keyword "workspace 5, monitor:eDP-1"
hyprctl keyword "workspace 6, monitor:eDP-1"
hyprctl keyword "workspace 7, monitor:eDP-1"
hyprctl keyword "workspace 8, monitor:eDP-1"
hyprctl keyword "workspace 9, monitor:eDP-1"
hyprctl keyword "workspace 10, monitor:eDP-1"

hyprctl dispatch moveworkspacetomonitor 1 eDP-1
hyprctl dispatch moveworkspacetomonitor 2 eDP-1
hyprctl dispatch moveworkspacetomonitor 3 eDP-1
hyprctl dispatch moveworkspacetomonitor 4 eDP-1
hyprctl dispatch moveworkspacetomonitor 5 eDP-1
hyprctl dispatch moveworkspacetomonitor 6 eDP-1
hyprctl dispatch moveworkspacetomonitor 7 eDP-1
hyprctl dispatch moveworkspacetomonitor 8 eDP-1
hyprctl dispatch moveworkspacetomonitor 9 eDP-1
hyprctl dispatch moveworkspacetomonitor 10 eDP-1

script_dir=$(dirname $0)
$script_dir/restart-waybar.sh home
