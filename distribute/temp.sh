#!/bin/bash

script_dir="$(realpath $(dirname $0))"
dot_dir="$(realpath $script_dir/..)"

cfg_dir="$XDG_CONFIG_HOME"
[[ -z $cfg_dir ]] && cfg_dir="$HOME/.config";

function status_line() {
    printf "$1 %-10s %s\n" "$2" "$3"
}

function symlink_as_is() {
    mkdir -p $2
    for file in $(ls $1); do ln -sf $1/$file $2/$file; done
}

status_line "updating" "bin" "$HOME/.local/bin"
symlink_as_is $dot_dir/bin $HOME/.local/bin

for item in ranger; do
    target="$cfg_dir/$item"
    status_line "updating" $item $target
    symlink_as_is $dot_dir/$item $target
done

