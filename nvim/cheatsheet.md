# Neovim Cheatsheet


## Modes

    i          insert before cursor
    a          insert after cursor
    o / O      new line below / above
    v / V      visual char / line
    C-v        visual block
    Esc        back to normal
    :          command mode


## Navigation

    h j k l          left down up right
    w / b            next / prev word
    e                end of word
    0 / ^            col 0 / first non-blank
    $                end of line
    gg / G           top / bottom of file
    {N}G             go to line N
    %                jump to matching bracket
    C-d / C-u        half page down / up
    C-o / C-i        jump back / forward in jumplist
    *                search word under cursor


## Editing

    d{motion}        delete  (dw, dd, d$, ...)
    c{motion}        change (delete + insert)
    y{motion}        yank
    p / P            paste after / before
    u / C-r          undo / redo
    .                repeat last change
    r{char}          replace char under cursor
    ~                toggle case
    >> / <<          indent / unindent line
    ={motion}        auto-indent


## Search and Replace

    /{pattern}           search forward
    ?{pattern}           search backward
    n / N                next / prev match
    :s/old/new/g         replace in line
    :%s/old/new/g        replace in file
    :%s/old/new/gc       replace with confirmation


## Windows and Buffers

    :sp / :vsp       horizontal / vertical split
    C-w h/j/k/l      move between windows
    C-w =            equalize window sizes
    :bd              close buffer
    :bn / :bp        next / prev buffer
    :ls              list buffers


---


## Lua Basics

### Types

```lua
local x = 42
local s = "hello"
local t = { 1, 2, 3 }      -- array
local m = { a = 1, b = 2 } -- map
local f = function() end
```

### Control flow

```lua
if x > 0 then
  -- ...
elseif x == 0 then
  -- ...
else
  -- ...
end

for i, v in ipairs(t) do   -- array
  print(i, v)
end

for k, v in pairs(m) do    -- map
  print(k, v)
end
```

### Useful

```lua
vim.inspect(value)   -- pretty-print any value, good for debugging
```


---


## vim.opt

```lua
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.laststatus = 3      -- single global statusline

vim.opt.rtp:prepend("/some/path")   -- append/prepend list options
```


## vim.g

```lua
vim.g.mapleader = ";"        -- must be set before lazy loads
vim.g.maplocalleader = ";"
vim.g.some_plugin_var = 1    -- same as: let g:some_plugin_var = 1
```


---


## Keybindings

```lua
vim.keymap.set(mode, lhs, rhs, opts)
```

mode: "n", "i", "v", "t", or a list {"n", "t"}

Common opts:

```lua
{ noremap = true, silent = true }
{ noremap = true, silent = true, buffer = bufnr }  -- buffer-local
{ desc = "shown in which-key" }
```

Examples:

```lua
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>")

vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true })

-- buffer-local
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })

-- multiple modes
vim.keymap.set({"n", "t"}, "<C-\\>", toggle_console)
```

Leader in this config: `;`


---


## Autocommands

```lua
vim.api.nvim_create_autocmd("EventName", {
  pattern = "*",
  callback = function(args)
    -- args.buf   = buffer number
    -- args.file  = file path
    -- args.match = matched pattern
  end,
})
```

Common events:

    BufWritePre    before saving
    LspAttach      when an LSP client attaches to a buffer
    TermOpen       when a terminal buffer opens
    ColorScheme    after colorscheme loads

Example - format on save:

```lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
```

Example - set highlight after colorscheme:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff" })
  end,
})
```


---


## LSP (Nvim 0.11+)

Enable servers:

```lua
vim.lsp.enable({ "pyright", "rust_analyzer", "gopls" })
```

Configure a server:

```lua
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
  },
})
```

Global config for all servers:

```lua
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})
```

Keymaps on attach:

```lua
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = { buffer = args.buf }
    vim.keymap.set("n", "gd",        vim.lsp.buf.definition,    buf)
    vim.keymap.set("n", "gD",        vim.lsp.buf.declaration,   buf)
    vim.keymap.set("n", "gi",        vim.lsp.buf.implementation, buf)
    vim.keymap.set("n", "gr",        vim.lsp.buf.references,    buf)
    vim.keymap.set("n", "<C-l>",     vim.lsp.buf.hover,         buf)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename,        buf)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action,   buf)
    vim.keymap.set("n", "<space>f",  function()
      vim.lsp.buf.format({ async = true })
    end, buf)
  end,
})
```

Diagnostics:

```lua
vim.keymap.set("n", "[d",       vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d",       vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
```


---


## lazy.nvim Plugin Structure

Each file in lua/plugins/ returns a spec table:

```lua
return {
  "author/plugin-name",

  ft = { "python", "lua" },     -- load only for these filetypes
  event = "VeryLazy",           -- load on event

  -- sets up keymaps and triggers load
  keys = {
    { "<leader>x", "<cmd>SomeCmd<CR>", desc = "Do something" },
  },

  -- passed to require("plugin").setup()
  opts = {
    some_option = true,
  },

  -- full control, replaces opts
  config = function()
    require("plugin").setup({ ... })
  end,

  dependencies = { "nvim-lua/plenary.nvim" },
}
```

Lazy commands:

    :Lazy           open UI
    :Lazy update    update all plugins
    :Lazy sync      install + update + clean
    :Lazy clean     remove unused plugins


---


## Plugins in This Config

telescope    - fuzzy finder
    C-p        find files
    C-f        live grep
    ;b         buffers
    ;ht        help tags

oil.nvim     - file explorer (edit filesystem like a buffer)
    -          open / go up
    CR         enter dir or open file
    C-s        open in vertical split

blink.cmp    - completion
    C-Space    trigger
    CR         confirm

which-key    - keybinding popup
    ;?         show buffer-local keymaps

toggleterm   - terminal
    C-\        toggle


---


## Useful Commands

    :checkhealth          diagnose issues
    :Lazy                 plugin manager
    :Mason                install LSP servers and formatters
    :LspInfo              active LSP clients for current buffer
    :TSInstall <lang>     install treesitter grammar
    :noh                  clear search highlight
