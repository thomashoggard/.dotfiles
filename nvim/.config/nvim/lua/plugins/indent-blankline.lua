require("indent_blankline").setup({
	show_current_context = true,
})

vim.cmd([[highlight IndentBlanklineContextChar guifg=#666666 gui=nocombine]])
