#!/bin/sh

pacman -Suy man

pacman -Suy ntpd
systemctl enable --now ntpd

pacman -Suy bluez bluez-utils
systemctl enable --now bluetooth

pacman -Suy alsa-utils pipewire pipewire-docs pipewire-audio wireplumber pipewire-alsa
pacman -Suy libinput

pacman -Suy jdk-openjdk
pacman -Suy docker docker-compose
pacman -Suy go gopls delve 
pacman -Suy terraform
pacman -Suy autorandr

pacman -Suy rg lazygit

pacman -Suy discord obsidian chromium lazygit 
