return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- opts is equivalent to: require("lualine").setup(opts).
    -- note that `config = function() ... end` overrides opts.
    opts = {
      options = {
        theme = "powerline_dark",
      }
    },
}
