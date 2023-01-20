return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
    opts = {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        hop = true,
        lsp_trouble = true,
        neogit = true,
      }
    }
  },
  {
    "sainnhe/gruvbox-material"
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
    end,
  }
}
