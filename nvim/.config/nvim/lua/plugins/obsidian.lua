return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  ui = { enable = false },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/notes/personal",
      },
      {
        name = "league",
        path = "~/Documents/notes/league",
      },
    },
  },
}
