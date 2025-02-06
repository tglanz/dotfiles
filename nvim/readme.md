# nvim

Some stuff so I won't forget.

## TODOs

- [ ] Migrate [packer](https://github.com/wbthomason/packer.nvim) to [lazy](https://github.com/folke/lazy.nvim)

## General

For now, because Windows is making me some problems, I removed some of the plugins.

**neodev** is a package that supports neovim development. I don't use it atm. Also, it is in EOL and they themselves tells us to use [lazydev](https://github.com/folke/lazydev.nvim) instead.

> Action item: remove all neodev stuff, integrate lazydev!

**cmp** is used for autocompletion. It currently doesn't work - Cmp has some sub packages it uses, perhaps one of the is problematic?

> Action item: Fix cmp such that it'll work on Windows :face_vomiting:. Perhaps switch to [mini.completion](https://github.com/echasnovski/mini.completion)?

## Language Servers

**Lua** uses [lua-language-server](https://github.com/luals/lua-language-server/)o

Windows :face_comitting::

    winget install --id=LuaLS.lua-language-server -e

## Windows :face_vomiting:

### install-nvim-packages-windows script

I have removed the `install-nvim-packages-windows` script. Just enter neovim and type `:PackerSync` and pray.

### After PackerSync

#### Telescope

For telescope to work

1. Install [fd](https://github.com/sharkdp/fd). I recommend, as mentioned in the docs, to use `winget` for this. Just type

    winget install sharkdp.fd

2. Install [ripgrep](https://github.com/BurntSushi/ripgrep). I recommend, as mentioned in the docs, to use `winget` for this. Just type

    winget install BurntSushi.ripgrep.MSVC
