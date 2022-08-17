local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<C-b>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<C-f>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
