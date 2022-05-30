require("nvim-tree").setup({
  create_in_closed_folder = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  view = {
    hide_root_folder = true,
    relativenumber = true,
    width = 40,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
})
