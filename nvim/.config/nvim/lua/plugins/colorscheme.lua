return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        hop = true,
        lsp_trouble = true,
        neogit = true,
      }
    },
    config = function()
      vim.cmd [[colorscheme catppuccin]]
    end
  },
  {
    "sainnhe/gruvbox-material"
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
      -- vim.cmd [[colorscheme everforest]]
    end,
  }
}
