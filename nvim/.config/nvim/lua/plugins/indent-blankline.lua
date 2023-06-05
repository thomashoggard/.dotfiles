return {
  {
    -- Add indentation line guides.
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      vim.cmd([[highlight IndentBlanklineContextChar guifg=#868E96 gui=nocombine]])

      return {
        show_current_context = true,
      }
    end,
  }
}
