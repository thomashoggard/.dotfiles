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
  { "windwp/nvim-autopairs" }, -- Insert or delete brackets, params, quotes in pair.
  { "windwp/nvim-ts-autotag" }, -- Automatically add and rename html tags.
  { "tpope/vim-surround" },
  { "folke/trouble.nvim" }, -- Show linting errors in a panel
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    keys = {
      { "<leader>a", ":CodeActionMenu<cr>", silent = true }
    }
  },
  {
    "simnalamburt/vim-mundo",
    keys = {
      { "<F5>", ":MundoToggle<cr>", silent = true }
    }
  },
  {
    -- Delete buffers without closing it's window.
    "moll/vim-bbye",
    keys = {
      { "<leader>q", ":Bwipeout<cr>", silent = true }
    }
  }
}
