vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.opt.background = dark

vim.g.rainbow_active = 1
vim.opt.laststatus = 3

-- Disable arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')

-- In terminal mode, escape should go to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

