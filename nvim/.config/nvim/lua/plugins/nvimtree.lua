return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree", silent = true },
      { "<leader>r", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh nvim-tree", silent = true },
      { "<leader>n", "<cmd>NvimTreeFindFile<CR>", desc = "Find find", silent = true },
    },
    opts = {
      renderer = {
        root_folder_label = false,
      },
      view = {
        -- float = {
        --   enable = true,
        --   open_win_config = {
        --     relative = "editor",
        --     border = "rounded",
        --     width = 30,
        --     height = 50,
        --     row = 1,
        --     col = 10,
        --   },
        -- },
        adaptive_size = true,
        relativenumber = true,
      },
      git = {
        -- Increasing the timeout to support large projects
        timeout = 5000,
      },
    },
  },
}
