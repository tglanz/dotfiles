-- I initially wanted this in options.lua but this is somewhat problematic.
-- Once nightfox package is installed, that's fine.
-- However if the package is not installed yet, because options.lua is loaded
-- before plugins.lua, it interferes with the packer boot.
vim.cmd("colorscheme nightfox")
