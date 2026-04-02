-- Disable arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')

-- Quickfix
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>')

-- Page navigation (zz keeps cursor centered)
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
