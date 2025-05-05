return {
  "EdenEast/nightfox.nvim",
  -- For now we use other colorschemes.
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme nightfox")
  end,
}
