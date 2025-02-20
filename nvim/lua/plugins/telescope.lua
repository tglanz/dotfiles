return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    local opts = { noremap = true, silent = true }

    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
    vim.keymap.set('n', '<leader>b', builtin.buffers, opts)
    vim.keymap.set('n', '<C-f>', builtin.live_grep, opts)
    vim.keymap.set('n', '<leader>ft', builtin.help_tags, opts)

    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown {
          }
        }
      }
    }

    telescope.load_extension("ui-select")
  end
}
