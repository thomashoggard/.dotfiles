require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	styles = {
		comments = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "undercurl",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = true,
		lsp_saga = true,
		gitgutter = true,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
		},
		-- neotree = {
		--   enabled = true,
		-- },
		bufferline = true,
		markdown = true,
		ts_rainbow = true,
		hop = true,
	},
})

vim.cmd([[colorscheme catppuccin]])
--
-- vim.g.tokyonight_style = "night"
-- vim.cmd[[colorscheme tokyonight]]

-- vim.cmd[[colorscheme kanagawa]]

-- require('ayu').setup({
--   mirage = false,
-- })
--
-- vim.cmd[[colorscheme ayu]]
-- vim.cmd[[colorscheme ayu-light]]

-- vim.cmd[[colorscheme duskfox]]
-- vim.cmd[[colorscheme nordfox]]
-- Nightfox
-- Dayfox
-- Dawnfox
-- Duskfox
-- Nordfox
-- Terafox

-- vim.cmd[[colorscheme gruvbox-material]]
