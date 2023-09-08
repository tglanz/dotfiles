#!/bin/sh

pacman -Suy man

pacman -Suy ntpd
systemctl enable --now ntpd

pacman -Suy bluez bluez-utils
systemctl enable --now bluetooth

pacman -Suy autorandr

pacman -Suy alsa-utils pipewire pipewire-docs pipewire-audio wireplumber pipewire-alsa
pacman -Suy libinput

pacman -Suy ranger dolphin

pacman -Suy jdk-openjdk maven
pacman -Suy docker docker-compose
pacman -Suy kubectl helm k9s stern
pacman -Suy go gopls delve 
pacman -Suy terraform

pacman -Suy rg lazygit

pacman -Suy discord obsidian chromium lazygit 
