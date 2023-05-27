local opts = { noremap = true, silent = true }

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>b', builtin.buffers, opts)
vim.keymap.set('n', '<C-f>', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>ft', builtin.help_tags, opts)

telescope.setup {
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown {
      }
    }
  }
}

telescope.load_extension("ui-select")
