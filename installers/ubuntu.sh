#!/bin/sh

apt update
apt upgrade

aot isntall -y neovim
apt install -y ranger

apt install -y openjdk-19-jre-headless maven

# TODO
# pacman -Suy kubectl helm k9s stern
apt install -y golang-go gopls delve 

# TODO
# pacman -Suy terraform
# pacman -Suy meson ninja
# pacman -Suy rg lazygit

# language servers
# TODO: support
# I DONT KNOW IF SUDOING THIS IS GOOD npm install -g yaml-language-server
# pacman -Suy lua-language-server
