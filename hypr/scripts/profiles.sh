#!/bin/bash

profile_name=$1

script_dir=$(dirname $0)

set -euo pipefail

function info() {
  printf "\e[33m[INFO]\e[0m %s\n" "$1"
}

function error() {
  printf "\e[31m[ERROR]\e[0m %s\n" "$1" 1>&2
}

get_monitor_names() {
  hyprctl monitors | sed -n 's/^Monitor \([^ ]*\) .*/\1/p'
}

detect_profile() {
  monitor_names=$(get_monitor_names)
  number_of_monitors=$(echo "$monitor_names" | wc -l)

  if [[ "$number_of_monitors" == 1 ]]; then
    echo "mobile"
  else
    echo "home"
  fi
}

disable_all_monitors() {
  monitor_names=$(get_monitor_names)
  for monitor in $monitor_names; do
    info "Disabling monitor: $monitor"
    hyprctl keyword "monitor $monitor,disable" >/dev/null
  done
}

load_profile() {
  profile_name=$1
  profile_path=$(realpath $script_dir/set-profile-$profile_name.sh)
  if [[ ! -f $profile_path ]]; then
    error "Profile not found: $profile_name. Looked at: $profile_path"
    exit 1
  fi

  # Don't abort if this errored, so we will enabled the monitors
  disable_all_monitors 

  info "Loading profile: $profile_name"
  if ! "$profile_path"; then
    error "Failed to load profile: $profile_name"
    exit 1
  fi
}

update_profile() {
  profile=$(detect_profile)
  load_profile $profile
}

if declare -f "$1" >/dev/null; then
  "$1" "${@:2}"
else
  error "Not declared \"$1\""
fi
