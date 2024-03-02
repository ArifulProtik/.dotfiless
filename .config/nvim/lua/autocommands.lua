-- Virtual Text
local default_diagnostic_config = {
	virtual_text = true,
	update_in_insert = true,
	underline = false,
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
vim.diagnostic.config(default_diagnostic_config)

local icons = require("icons").diagnostics
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = icons.Error })
sign({ name = "DiagnosticSignWarn", text = icons.Warning })
sign({ name = "DiagnosticSignHint", text = icons.Hint })
sign({ name = "DiagnosticSignInfo", text = icons.Information })
