require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"javascript",
		"json",
		"lua",
		"typescript",
		"tsx",
		"css",
		"yaml",
		"dockerfile",
		"go",
		"markdown",
		"bash",
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = true,
	},
})
