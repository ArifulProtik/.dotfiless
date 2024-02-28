return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"lua_ls",
				"cssls",
				"html",
				"pyright",
				"bashls",
				"jsonls",
				"gopls",
				"templ",
			}
			local lspconfig = require("lspconfig")

			local default_diagnostic_config = {
				virtual_text = true,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}

			-- Hover Document
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
			require("lspconfig.ui.windows").default_options.border = "rounded"

			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
			vim.keymap.set("n", "gn", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
			vim.diagnostic.config(default_diagnostic_config)

			require("mason").setup()
			local ensure_installed = {
				"stylua",
				"prettier",
				"eslint",
			}
			-- copy server table to ensure_installed
			for _, server in pairs(servers) do
				table.insert(ensure_installed, server)
			end

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- On Attach Function

			local on_attach = function(client, bufnr) end

			-- Pass capabilities to CMP
			for _, server in pairs(servers) do
				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
				if require_ok then
					opts = vim.tbl_deep_extend("force", settings, opts)
				end

				lspconfig[server].setup(opts)
			end
		end,
	},
}
