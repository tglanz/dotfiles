#!/bin/bash

monitors=($(xrandr -q | grep "^.* connected" | cut -d ' ' -f 1 | sort))

count=${#monitors[@]}

if [[ $count -eq 3 ]]; then
    echo "3 monitors detected"
    bspc monitor ${monitors[0]} -d 1 2 3
    bspc monitor ${monitors[1]} -d 4 5 6
    bspc monitor ${monitors[2]} -d 7 8 9 0
elif [[ $count -eq 2 ]]; then
    echo "2 monitors detected"
    bspc monitor ${monitors[0]} -d 1 2 3 4 5 
    bspc monitor ${monitors[1]} -d 6 7 8 9 0
else
    echo "1 monitor detected"
    bspc monitor -d 1 2 3 4 5 6 7 8 9 0
fi
