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
  { "unblevable/quick-scope" }, -- Always-on highlight for a unique char in every word for f,F and family
  { -- Insert or delete brackets, params, quotes in pair.
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  { -- Automatically add and rename html tags.
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
  { "folke/trouble.nvim" }, -- Show linting errors in a panel
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
  {
    -- Delete buffers without closing it's window.
    "moll/vim-bbye",
    keys = {
      { "<leader>q", ":Bwipeout<CR>", silent = true }
    }
  }
}
