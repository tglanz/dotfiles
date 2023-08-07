#!/bin/sh

pacman -Suy man

pacman -Suy bluez bluez-utils
pacman -Suy alsa-utils pipewire pipewire-docs pipewire-audio wireplumber pipewire-alsa
pacman -Suy libinput

pacman -Suy jdk-openjdk
pacman -Suy docker docker-compose
pacman -Suy go gopls delve 
pacman -Suy terraform
pacman -Suy autorandr

pacman -Suy rg lazygit

pacman -Suy discord obsidian chromium lazygit 
