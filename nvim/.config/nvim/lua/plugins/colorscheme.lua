return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      term_colors = true,
      transparent_background = false,
      integrations = {
        hop = true,
        lsp_trouble = true,
        neogit = true,
      },
      color_overrides = {
        mocha = {
          base = "#070D1C",
          mantle = "#060B18",
          crust = "#060B18",
        },
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      -- vim.cmd.colorscheme 'catppuccin'
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
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      background = {
        dark = "dragon"
      },
    },
    config = function(_, opts)
      require('kanagawa').setup(opts);
      vim.cmd.colorscheme 'kanagawa'
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require('rose-pine').setup(opts);
      -- vim.cmd.colorscheme 'rose-pine'
    end
  }
}
