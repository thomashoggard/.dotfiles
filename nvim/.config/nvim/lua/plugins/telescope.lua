local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.load_extension("fzy_native")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "yarn.lock", "package-lock.json", "__snapshots__" },
		path_display = { "truncate" },
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
		},
	},
})
