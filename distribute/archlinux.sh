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
    for file in $(ls $1); do 
      ln -sf $1/$file $2/$file 
    done
}


function symlink_as_is2() {
    ln -sf $1 $2
}

# Symlink the binaries
status_line "updating" "bin" "$HOME/.local/bin"
symlink_as_is $dot_dir/bin $HOME/.local/bin

# Symlink standard configurations
for item in nvim rofi xbindkeys bspwm polybar alacritty ranger htop qutebrowser tmux; do
    target="$cfg_dir/$item"
    status_line "updating" $item $target
    symlink_as_is2 $dot_dir/$item $target
done

# vim 
vim_dir="$HOME/.vim"
status_line "updating" "vim" "$vim_dir"
mkdir -p $vim_dir
ln -sf $dot_dir/vim/vimrc $vim_dir/vimrc
mkdir -p $vim_dir/bundle
if [[ ! -d $vim_dir/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $vim_dir/bundle/Vundle.vim >/dev/null
else
    git -C $vim_dir/bundle/Vundle.vim pull >/dev/null
fi
vim +PluginInstall +qall

# neovim
$script_dir/install-nvim-packages.sh
$script_dir/distribute-autorandr.sh
