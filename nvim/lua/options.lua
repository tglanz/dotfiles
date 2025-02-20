# uname :: { version, sysname, release, machine }
local uname = vim.loop.os_uname()

if uname.sysname == "Windows_NT" then
  vim.opt.shell = "powershell"
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

-- Color scheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern="*",
  callback = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff" })
  end
})
vim.g.rainbow_active = 1

-- vim.opt.background = dark

vim.opt.laststatus = 3

-- Disable arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')

-- Quickfix
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>')
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>')

