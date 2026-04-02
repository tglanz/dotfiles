return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
      },
    }
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      -- we can check what servers are missing by lsp config by checkhealth
      ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "yamlls",
        "ts_ls",
        "fortls",
        "clangd",

        -- java must be installed. prefer sdkman:
        --   sdk install java 21.0.6-tem
        --   sdk default java 21.0.6-tem
        "jdtls",

        -- needs go
        "gopls",

        -- rust-analyzer should be installed with rustup :(
      }
    },
  },
}
