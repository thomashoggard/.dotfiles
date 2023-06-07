return {
  {
    "hoob3rt/lualine.nvim",
    opts = {
      sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
      },
      inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
      },
      winbar = {
        lualine_c = { 'filename' },
      },
      inactive_winbar = {
        lualine_c = { 'filename' },
      }
    }
  }
}
