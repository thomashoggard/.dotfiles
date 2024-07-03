return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- Insert or delete brackets, params, quotes in pair.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        move_cursor = false,
      })
    end,
  },
  -- Show linting errors in a panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>d",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
    opts = {},
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<F5>", "<cmd>UndotreeToggle<CR>", silent = true },
    },
  },
  -- Delete buffers without closing it's window.
  {
    "moll/vim-bbye",
    keys = {
      { "<leader>q", "<cmd>Bwipeout<CR>", silent = true },
    },
  },
  -- Pretty quickfix list.
  {
    "yorickpeterse/nvim-pqf",
    config = function()
      require("pqf").setup()
    end,
  },
}
