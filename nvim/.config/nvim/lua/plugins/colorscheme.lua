return {
  -- {
  --   "sam4llis/nvim-tundra",
  --   opts = {},
  --   config = function(_, opts)
  --     -- vim.g.tundra_biome = "jungle" -- 'arctic' or 'jungle'
  --     require("nvim-tundra").setup(opts)
  --     -- vim.cmd.colorscheme("tundra")
  --   end,
  -- },
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   opts = {},
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts)
  --     -- vim.cmd.colorscheme("tokyodark")
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night",
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     -- vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     flavour = "mocha",
  --     term_colors = true,
  --     transparent_background = false,
  --     integrations = {
  --       hop = true,
  --       lsp_trouble = true,
  --       neogit = true,
  --     },
  --     color_overrides = {
  --       mocha = {
  --         base = "#070D1C",
  --         mantle = "#060B18",
  --         crust = "#060B18",
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     -- vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
      -- vim.g.gruvbox_material_better_performance = 1

      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- compile = true,
      -- background = {
      --   -- dark = "dragon",
      --   dark = "wave",
      -- },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
