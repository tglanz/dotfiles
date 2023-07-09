#!/bin/sh

DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
NVIM_HOME="$DATA_HOME/nvim"

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  $NVIM_HOME/site/pack/packer/start/packer.nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
