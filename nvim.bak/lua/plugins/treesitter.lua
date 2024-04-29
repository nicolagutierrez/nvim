return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()  
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "python", "c", "rust", "kotlin", "java" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
