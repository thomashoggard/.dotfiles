return {
  {
    -- Add indentation line guides.
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
      vim.cmd([[highlight IblIndent guifg=#0D1935 gui=nocombine]])
      vim.cmd([[highlight IblScope guifg=#2C547C gui=nocombine]])

      return {
        indent = {
          -- char = '┊'
        },
        whitespace = {
          highlight = { "Whitespace" }
        },
        scope = {
          show_start = false,
          show_end = false
        }
      }
    end,
  }
}
