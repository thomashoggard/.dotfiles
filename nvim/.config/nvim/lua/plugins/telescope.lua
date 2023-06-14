return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<C-p>",      ":Telescope git_files<cr>",  desc = "", silent = true },
      { "<leader>fp", ":Telescope find_files<cr>", desc = "", silent = true },
      { "<leader>fg", ":Telescope live_grep<cr>",  desc = "", silent = true },
      { "<leader>fb", ":Telescope buffers sort_mru=true ignore_current_buffer=true<cr>", desc = "", silent = true
      },
      {
        "<leader>fh",
        ":Telescope help_tags<cr>",
        desc = "",
        silent = true
      },
      {
        "<leader>fg",
        '"zy:Telescope live_grep default_text=<C-r>z<cr>',
        mode = "v",
        desc = "Search on selected text",
        silent = true
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
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
    }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {
      "junegunn/fzf.vim",
      "nvim-telescope/telescope.nvim"
    },
    build = "make",
    config = function()
      local telescope = require("telescope")
      telescope.load_extension('fzf')
    end,
  }
}
