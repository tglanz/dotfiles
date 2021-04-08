#!/bin/bash

config=$XDG_CONFIG_HOME/polybar/config
echo "using configuration file at $config"

echo "killing all monitors"
killall -q polybar

umask 000

for monitor in $(xrandr -q | grep " connected " | cut -d ' ' -f 1); do
    for bar in "top" "bottom"; do
        echo "starting bar $bar for monitor $monitor"
        MONITOR=$monitor polybar -r -c $config $bar >> /tmp/polybar.$monitor.$bar.log 2>&1 &
    done
done

echo "done"

