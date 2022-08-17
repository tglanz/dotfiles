local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<C-l>', vim.lsp.buf.hover, opts)
end


servers = {
  lspconfig.pyright,
  lspconfig.rust_analyzer,
  lspconfig.gopls,
  lspconfig.bashls,
  lspconfig.tsserver,
}

for _, server in ipairs(servers) do 
  server.setup {
    on_attach = on_attach
  }
end

-- lspconfig.pyright.setup {
--   on_attach = on_attach
-- }
-- 
-- lspconfig.rust_analyzer.setup {
-- }
-- 
-- -- local rt = require('rust-tools')
-- -- rt.setup({
-- --   server = {
-- --     on_attach = function(client, bufnr)
-- --       on_attach(client, bufnr)
-- -- 
-- --       vim.keymap.set('n', '<leader>b', rt.hover_actions.hover_actions, { buffer = bufnr }) 
-- --       vim.keymap.set('n', '<leader>a', rt.code_action_group.code_action_group, { buffer = bufnr }) 
-- --     end,
-- --     -- on_attach = function(_, bufnr)
-- --     --   vim.keymap.set("n", '<C-space>', rt.hover_actions.hover_actions, {
-- --     --     buffer = bufnr
-- --     --   })
-- --     --   vim.keymap.set("n", '<leader>a', rt.code_action_group.code_action_group, {
-- --     --     buffer = bufner
-- --     --   })
-- --     -- end
-- --   },
-- -- })
-- 
-- lspconfig.gopls.setup{
--   on_attach = on_attach
-- }
