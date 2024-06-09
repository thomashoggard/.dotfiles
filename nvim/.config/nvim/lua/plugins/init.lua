return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = {
      { "<leader>fw", ":HopWord<cr>", silent = true }
    },
    opts = {
      keys = "etovxqpdygfblzhckisuran"
    }
  },
  -- Always-on highlight for a unique char in every word for f,F and family
  { "unblevable/quick-scope" },
  -- Insert or delete brackets, params, quotes in pair.
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  -- Automatically add and rename html tags.
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        move_cursor = false
      })
    end
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
      { "<F5>", ":UndotreeToggle<CR>", silent = true }
    }
  },
  -- Delete buffers without closing it's window.
  {
    "moll/vim-bbye",
    keys = {
      { "<leader>q", ":Bwipeout<CR>", silent = true }
    }
  },
  -- More pretty quickfix list.
  {
    "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function()
      require("pqf").setup()
    end
  },
}
