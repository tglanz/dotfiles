local hop = require('hop')
local hint = require('hop.hint')
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'f', ':HopWord<CR>', opts)
vim.api.nvim_set_keymap('n', 'F', ':HopAnywhere<CR>', opts)
