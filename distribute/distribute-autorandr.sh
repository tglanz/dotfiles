#!/bin/sh

cd $(dirname $0)/..

config_path=$(realpath ${XDG_CONFIG_HOME:-~/.config})
mkdir -p $config_path/autorandr

source=$(realpath ./autorandr/postswitch)
target=$config_path/autorandr/postswitch
echo "$source -> $target"
ln -sf ./autorandr/postswitch $config_path/autorandr/postswitch
