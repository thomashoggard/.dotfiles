return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = "<cmd>TSUpdate",
    opts = {
      auto_install = true,
      -- ensure_installed = "all",
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- {
  --   -- Shows the context of the function as you scroll through the code.
  --   'nvim-treesitter/nvim-treesitter-context',
  --   config = function()
  --     require("treesitter-context").setup({
  --       enable = true
  --     })
  --   end,
  -- },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
