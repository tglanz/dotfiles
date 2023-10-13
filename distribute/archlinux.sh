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
for item in nvim rofi xbindkeys bspwm polybar alacritty ranger htop qutebrowser tmux hypr waybar; do
  symlink_as_is $dot_dir/$item $cfg_dir
done

# vim 
# vim_dir="$HOME/.vim"
# status_line "updating" "vim" "$vim_dir"
# mkdir -p $vim_dir
# ln -sf $dot_dir/vim/vimrc $vim_dir/vimrc
# mkdir -p $vim_dir/bundle
# if [[ ! -d $vim_dir/bundle/Vundle.vim ]]; then
#     git clone https://github.com/VundleVim/Vundle.vim.git $vim_dir/bundle/Vundle.vim >/dev/null
# else
#     git -C $vim_dir/bundle/Vundle.vim pull >/dev/null
# fi
# vim +PluginInstall +qall

# neovim
$script_dir/install-nvim-packages.sh

$script_dir/distribute-autorandr.sh
