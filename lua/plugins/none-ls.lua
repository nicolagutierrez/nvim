return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    local null_ls = require("null-ls")

    -- Initialize opts.sources if not already done
    opts.sources = opts.sources or {}

    -- Insert Prettier (from the second config)
    table.insert(opts.sources, null_ls.builtins.formatting.prettier)

    -- Combine sources from the first config
    local sources = {
      null_ls.builtins.code_actions.refactoring,
      null_ls.builtins.formatting.stylua,
      -- Python
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      -- Java
      null_ls.builtins.diagnostics.checkstyle.with({
        extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self-written rules
      }),
      null_ls.builtins.formatting.google_java_format,
      -- Kotlin
      null_ls.builtins.diagnostics.ktlint,
      null_ls.builtins.formatting.ktlint,
      -- Docker
      null_ls.builtins.diagnostics.hadolint,
    }

    -- Append sources from the first config
    for _, source in ipairs(sources) do
      table.insert(opts.sources, source)
    end

    -- Setup null-ls with the merged sources
    null_ls.setup({ sources = opts.sources })

    -- Define keymap from the first config
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
