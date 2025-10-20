#!/bin/bash

killall waybar 2>/dev/null || true

config_dir=$(dirname $0)/../waybar
config_file="$config_dir/config.$1.json"
style_file="$config_dir/style.css"

if ! [ -f $config_file ]; then
  echo "Cannot find config file: $config_file" 1>&2
  exit 1
fi

if ! [ -f $style_file ]; then
  echo "Cannot find style file: $style_file" 1>&2
  exit 1
fi

waybar -c "$config_file" -s "$style_file" &
