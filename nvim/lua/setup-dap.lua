local dap = require('dap')
local dap_vscode = require('dap.ext.vscode')

dap.set_log_level('TRACE')

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<leader><F5>', dap.disconnect)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
-- vim.keymap.set('n', '<Leader>lp', dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')))
vim.keymap.set('n', '<Leader>dr', dap.repl.open)
vim.keymap.set('n', '<Leader>dl', dap.run_last)

-- js

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { "/opt/js-debug-dap/js-debug/src/dapDebugServer.js", "${port}" },
  }
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  }
}

-- dap.configurations.javascript = {
--   {
--     type = "node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   }
-- }

-- dap.adapters.python = {
--   type = 'executable';
--   command = 'python3';
--   args = { '-m', 'debugpy.adapter' }
-- }

-- go, delve

dap.adapters.delve = {
  type = 'server',
  port = '5676',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', 'localhost:5676' },
  }
}

dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug Current File',
    request = 'launch',
    program = '${file}',
  }
}

-- python

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    name = 'Debug Current File',
    request = 'launch',
    program = '${file}',
  }
}

-- codelldb


local codelldb_extension_home         = os.getenv("CODELLDB_EXTENSION_HOME") or "/opt/codelldb/extension"

dap.adapters.codelldb                 = {
  type = 'server',
  port = '5677',
  executable = {
    command = codelldb_extension_home .. "/adapter/codelldb",
    args = { '--port', '5677' },
  }
}

local codelldb_default_configurations = {
  {
    type = 'codelldb',
    name = 'Debug a.out',
    request = 'launch',
    program = 'a.out',
    cwd = '${workspaceFolder}',
  },
}

dap.configurations.c                  = codelldb_default_configurations
dap.configurations.cpp                = codelldb_default_configurations
dap.configurations.rust               = codelldb_default_configurations

-- automatically load .vscode/launch.json

dap_vscode.load_launchjs('.vscode/launch.json', {
  ["pwa-node"] = { 'javascript', 'typescript' },
  delve = { 'go' },
  python = { 'python' },
  codelldb = { 'c', 'cpp', 'rust' },
})
