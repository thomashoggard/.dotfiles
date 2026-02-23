return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = {
          {
            "filename",
          },
        },
        lualine_x = { "filetype" },
      },
      inactive_sections = {
        lualine_c = {
          {
            "filename",
          },
        },
        lualine_x = { "filetype" },
      },
      winbar = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
      },
      inactive_winbar = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
      },
    },
  },
}
