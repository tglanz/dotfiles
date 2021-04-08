#!/bin/bash

dot_dir="$(realpath $(dirname $0))"

cfg_dir="$XDG_CONFIG_HOME"
[[ -z $cfg_dir ]] && cfg_dir="$HOME/.config";

echo "Preparing vim"
vim_dir="$HOME/.vim"
mkdir -p $vim_dir
ln -sf $dot_dir/vim/vimrc $vim_dir/vimrc
mkdir -p $vim_dir/bundle
if [[ ! -d $vim_dir/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $vim_dir/bundle/Vundle.vim
else
    git -C $vim_dir/bundle/Vundle.vim pull
fi
vim +PluginInstall +qall