local uname = vim.uv.os_uname()

if uname.sysname == "Windows_NT" then
  vim.opt.shell = "pwsh"
end

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.splitright = true

vim.opt.laststatus = 3

-- Folding using treesitter syntax tree. Folds are open by default.
-- za: toggle fold, zc: close, zo: open, zM: close all, zR: open all
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

-- Color scheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff" })
  end
})
