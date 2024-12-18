-- In terminal mode, escape should go to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<leader>tn', function()
  vim.cmd("vs term://zsh")
  vim.cmd("windcmd L")
end)

vim.api.nvim_create_autocmd("TermOpen", {
  pattern="*",
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.api.nvim_input('A')
  end
})
