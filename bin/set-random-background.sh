#!/bin/bash

backgrounds_dir=/usr/share/backgrounds

file=$(find $backgrounds_dir | grep -Po ".*jpg|.*png" | sort -R | head -n 1) 
echo "will set as background: $file"

feh -z --bg-fill $file

# feh -r -z --bg-fill /usr/share/backgrounds/
