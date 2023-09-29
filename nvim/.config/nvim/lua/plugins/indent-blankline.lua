return {
  {
    -- Add indentation line guides.
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- opts = {}
    opts = function()
      vim.cmd([[highlight IblIndent guifg=#0D1935 gui=nocombine]])
      vim.cmd([[highlight IblScope guifg=#192F66 gui=nocombine]])

      return {
        indent = {
          char = '┊'
        },
        whitespace = {
          highlight = { "Whitespace" }
        },
      }
    end,
  }
}
