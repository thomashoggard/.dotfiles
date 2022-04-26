vim.g.nvim_tree_create_in_closed_folder = 1

require("nvim-tree").setup({
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
      resize_window = true,
    },
  },
})
