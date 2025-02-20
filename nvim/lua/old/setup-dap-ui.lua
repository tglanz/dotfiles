local dapui = require("dapui")
local dap = require("dap")

-- toggle dapui entirely
vim.keymap.set('n', '<leader>tt', dapui.toggle) 

-- floating windows
float_opts = { width = 50, height = 50, enter = true }
vim.keymap.set('n', '<leader>tb', function() dapui.float_element("breakpoints", float_opts) end)
vim.keymap.set('n', '<leader>ts', function() dapui.float_element("stacks", float_opts) end)

-- open / close dapui when dap starts / closes
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close 
dap.listeners.before.event_exited["dapui_config"] = dapui.close 

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window, Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  layouts = {
    {
      elements = {
        "watches",
        "scopes",
      },
      size = 0.25, 
      position = "left",
    },
    {
      elements = {
        "breakpoints",
        "repl",
      },
      size = 0.25,
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
