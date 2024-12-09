return {
  {
    "tiagovla/tokyodark.nvim",
    opts = {},
    config = function(_, opts)
      require("tokyodark").setup(opts)
      vim.cmd.colorscheme("tokyodark")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      on_colors = function(colors)
        -- colors.green = "#B9DFA7"
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
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
      require("catppuccin").setup(opts)
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "sainnhe/gruvbox-material",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      background = {
        dark = "dragon",
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
}
