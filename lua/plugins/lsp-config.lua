return {
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "lua_ls",
          "bashls",
          "clangd",
          "dockerls",
          "docker_compose_language_service",
          "gradle_ls",
          "jsonls",
          "jdtls",
          "tsserver",
          "kotlin_language_server",
          "mesonlsp",
          "pyright", -- keep an eye on it
          "rust_analyzer",
          "sqlls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.gradle_ls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.kotlin_language_server.setup({})
      lspconfig.mesonlsp.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.sqlls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  }
}
