#!/bin/bash

script_dir="$(realpath $(dirname $0))"
dot_dir="$(realpath $script_dir/..)"

cfg_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

function status_line() {
  printf "\e[32m%-10s \e[0m%-10s %s\n" "$1" "$2" "$3"
}

function symlink_as_is() {
  status_line "Symlinking" "$1" "$2"
  ln -sf $1 $2
}

# Symlink the binaries
symlink_as_is $dot_dir/bin $HOME/.local

# Symlink standard configurations
for item in nvim ranger htop tmux; do
  symlink_as_is $dot_dir/$item $cfg_dir
done
