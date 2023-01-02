require("nvim-tree").setup({
  open_on_setup = true,
  -- renderer = {
  --   indent_markers = {
  --     enable = true,
  --   },
  -- },
  view = {
    adaptive_size = true,
    hide_root_folder = true,
    -- relativenumber = true,
  },
  -- actions = {
  --   open_file = {
  --     resize_window = false,
  --   },
  -- },
  filters = {
    exclude = { '.env' }
  }
})
