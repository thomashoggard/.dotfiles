return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Find Git files", silent = true },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status", silent = true },
      { "<leader>fp", "<cmd>Telescope find_files<cr>", desc = "Find files", silent = true },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find document symbols", silent = true },
      { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Find registers", silent = true },
      { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Find references", silent = true },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find marks", silent = true },
      { "<leader>fe", "<cmd>Telescope resume<cr>", desc = "Resume", silent = true },
      { "<leader>fg", "<cmd>Telescope live_grep_args<cr>", desc = "Live Grep", silent = true },
      {
        "<leader>fg",
        '"zy:Telescope live_grep_args default_text=<C-r>z<cr>',
        mode = "v",
        desc = "Search on selected text",
        silent = true,
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<cr>",
        desc = "List all buffers in chronological order of last accessed",
        silent = true,
      },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "", silent = true },
      {
        "<leader>fd",
        "<cmd>Telescope grep_string<cr>",
        desc = "Find word",
        silent = true,
      },
      { "<leader>fc", "<cmd>Telescope quickfix<cr>", desc = "Quick Fix", silent = true },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "yarn.lock", "package-lock.json", "pnpm-lock.yaml", "__snapshots__" },
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {
      "junegunn/fzf.vim",
      "nvim-telescope/telescope.nvim",
    },
    build = "make",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      telescope.setup({
        defaults = {
          mappings = {
            n = {
              ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["q"] = require("telescope.actions").close,
            },
            i = {
              ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
              },
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")
    end,
  },
}
