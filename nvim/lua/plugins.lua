return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'EdenEast/nightfox.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
      }
  }

  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  local protocol = require'vim.lsp.protocol'

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/vim-vsnip" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "onsails/lspkind-nvim" },
    },
  }
end)
