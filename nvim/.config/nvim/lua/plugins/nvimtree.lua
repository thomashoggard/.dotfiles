vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_create_in_closed_folder = 1

require('nvim-tree').setup({
  view = {
    hide_root_folder = true,
    relativenumber = true,
    width = 40
  },
})
