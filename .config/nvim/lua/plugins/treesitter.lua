return {
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.filetype.add({
				extension = {
					templ = "templ",
				},
			})
		end,
	},
}
