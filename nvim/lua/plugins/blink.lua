return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>']     = { 'hide' },
      ['<Tab>']     = { 'accept', 'fallback' },
      ['<C-n>']    = { 'select_next', 'fallback' },
      ['<C-p>']    = { 'select_prev', 'fallback' },
      ['<Down>']   = { 'select_next', 'fallback' },
      ['<Up>']     = { 'select_prev', 'fallback' },
      ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = true },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    signature = {
      enabled = true,
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
