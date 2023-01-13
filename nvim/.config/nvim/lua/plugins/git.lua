-- Git
-- vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>")
-- vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>")
-- vim.keymap.set("n", "<leader>gj", ":diffget //3<CR>")

-- Set git merge marker highlights - See :h diff.txt
vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })

return {
  { "tpope/vim-fugitive" },
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
      current_line_blame_formatter_opts = {
        relative_time = true,
      },
      current_line_blame_formatter = "      <author>, <author_time> • <summary>",
      current_line_blame_formatter_nc = "      <author>",
    }
  },
  {
    "TimUntersberger/neogit",
    keys = {
      { "<leader>gg", ":Neogit<cr>" },
      { "<leader>gl", ":Neogit log<cr>" },
    },
    opts = {
      enhanced_diff_hl = false,
      disable_commit_confirmation = true,
      sections = {
        untracked = {
          folded = true
        },
        unstaged = {
          folded = true
        },
        staged = {
          folded = true
        },
        stashes = {
          folded = true
        },
        unpulled = {
          folded = true
        },
        unmerged = {
          folded = true
        },
        recent = {
          folded = true
        },
      },
    }
  },
  {
    -- TODO: Verify git mergetool still works with conflicts
    "akinsho/git-conflict.nvim",
    opts = {
      default_mappings = true, -- disable buffer local mapping created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffText',
        current = 'DiffAdd',
      }
    }
  }
}
