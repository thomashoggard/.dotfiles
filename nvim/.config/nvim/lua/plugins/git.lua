-- Set git merge marker highlights - See :h diff.txt
vim.api.nvim_set_hl(0, "DiffText", { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#ffffff", bg = "#1d3450" })

return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>" },
    },
  },
  {
    -- Git blame virtual text, code change markers.
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 250,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "      <author>, <author_time:%R> • <summary>",
      current_line_blame_formatter_nc = "      <author>",
    },
  },
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>" },
      { "<leader>gl", "<cmd>Neogit log<cr>" },
    },
    opts = {
      disable_commit_confirmation = true,
    },
  },
  {
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = true, -- disable buffer local mapping created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = {
        -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
}
