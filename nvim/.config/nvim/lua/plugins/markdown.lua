return {
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {
      heading = {
        icons = { "◉", "◎", "○", "✺", "▶", "⤷" },
        position = "inline",
      },
      code = {
        style = "full",
      },
      bullet = {
        right_pad = 1,
      },
      -- indent = {
      --   enabled = true,
      --   skip_level = 1,
      -- },
    },
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },
}
