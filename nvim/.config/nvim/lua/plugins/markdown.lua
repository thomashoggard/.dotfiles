return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- file_types = { "markdown" },
      -- heading = {
      --   icons = { "◉", "◎", "○", "✺", "▶", "⤷" },
      --   position = "inline",
      -- },
      -- code = {
      --   style = "full",
      -- },
      -- bullet = {
      --   right_pad = 1,
      -- },
      -- indent = {
      --   enabled = true,
      --   skip_level = 1,
      -- },
      completions = {
        lsp = {
          enabled = true,
        },
      },
    },
    -- name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      daily_notes = {
        folder = "0. Inbox",
      },
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/notes/personal",
        },
        {
          name = "work",
          path = "~/Documents/notes/league",
        },
      },
    },
  },
}
