local telescope = require("telescope")

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

telescope.load_extension('fzf')
