return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = { "prettier" },
			})
		end,
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
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
			lspconfig.gradle_ls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
			lspconfig.mesonlsp.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	},
}
