return {
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
    config = function()
      require("nvim-surround").setup()
    end
  },
  -- Show linting errors in a panel
  { "folke/trouble.nvim" },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    keys = {
      { "<leader>a", ":CodeActionMenu<cr>", silent = true }
    }
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
  -- Center currently focused buffer to the middle of the screen.
  -- {
  --   "shortcuts/no-neck-pain.nvim",
  --   opts = {
  --     width = 150
  --   }
  -- }
}
