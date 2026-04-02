return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').install({
      'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query',
      'elixir', 'heex', 'javascript', 'typescript', 'html',
      'fortran', 'python', 'go', 'rust', 'java', 'bash', 'yaml',
    })
  end,
}
