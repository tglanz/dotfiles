return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'EdenEast/nightfox.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    }
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup {
        keys = 'qweasdzxclkjh'
      }
    end
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    }
  }

  -- language servers
  use 'folke/neodev.nvim'
  use 'neovim/nvim-lspconfig'
  use 'lvimuser/lsp-inlayhints.nvim'
  use 'mfussenegger/nvim-jdtls' -- Java language server

  -- debugging
  use 'mfussenegger/nvim-dap'
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  }

  -- use 'ray-x/go.nvim'
  -- use 'ray-x/guihua.lua'

  local protocol = require 'vim.lsp.protocol'

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

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
  }
end)
