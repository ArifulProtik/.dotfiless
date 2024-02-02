return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				transparent = true,
				vim.cmd("colorscheme rose-pine"),
			})
		end,
	},
}
