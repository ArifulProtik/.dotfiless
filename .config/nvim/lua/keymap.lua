function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

Map({ "n", "x" }, "<C-s>", "<cmd>wa<CR>")
-- Telescope keymaps
Map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
Map("n", "<leader>g", "<cmd>Telescope live_grep<cr>")

Map("n", "<leader>w", "<cmd>Telescope buffers<cr>")
-- No Highlight
Map("n", "<leader>h", "<cmd>noh<cr>")

Map("n", "<leader>gg", "<cmd>LazyGit<cr>")
