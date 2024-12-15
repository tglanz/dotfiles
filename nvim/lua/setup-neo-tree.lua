local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>fr', ':Neotree reveal<CR>', {})
vim.keymap.set('n', '\\', ':Neotree toggle filesystem left<CR>', opts)
