vim.api.nvim_create_user_command("Light",
  function()
    vim.o.background = "light"
    vim.cmd [[colorscheme gruvbox-material]]
  end,
  {}
)

vim.api.nvim_create_user_command("Dark",
  function()
    vim.o.background = "dark"
    vim.cmd [[colorscheme catppuccin]]
  end,
  {}
)

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
