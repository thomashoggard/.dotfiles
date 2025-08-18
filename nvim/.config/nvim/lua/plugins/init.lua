return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  -- Insert or delete brackets, params, quotes in pair.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        move_cursor = false,
      })
    end,
  },
}
