require("bufferline").setup({
	options = {
		close_command = "Bdelete! %d",
		show_close_icon = false,
		show_buffer_close_icons = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
