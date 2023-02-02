return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree", silent = true },
      { "<leader>r", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh nvim-tree", silent = true },
      { "<leader>n", "<cmd>NvimTreeFindFile<CR>", desc = "Find find", silent = true },
    },
    opts = {
      view = {
        adaptive_size = true,
        hide_root_folder = true,
      },
    }
  },
}
