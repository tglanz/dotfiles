local toggleterm = require("toggleterm")
toggleterm.setup()

local Terminal = require("toggleterm.terminal").Terminal

local defaults = { hidden = true }
local console = Terminal:new(defaults)

function toggle_console()
  console:toggle()
end

local bufopts = {
  noremap = true,
  silent = false,
}

vim.keymap.set({"n", "t"}, '<c-\\>', toggle_console, bufopts)

vim.keymap.set("t", "<c-w>h", '<c-\\><c-n><c-w>h', bufopts)
vim.keymap.set("t", "<c-w>j", '<c-\\><c-n><c-w>j', bufopts)
vim.keymap.set("t", "<c-w>k", '<c-\\><c-n><c-w>k', bufopts)
vim.keymap.set("t", "<c-w>l", '<c-\\><c-n><c-w>l', bufopts)
