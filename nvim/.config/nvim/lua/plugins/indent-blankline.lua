return {
  {
    -- Add indentation line guides.
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = function()
      vim.cmd([[highlight IndentBlanklineContextChar guifg=#666666 gui=nocombine]])

      return {
        show_current_context = true,
      }
    end,
  }
}
