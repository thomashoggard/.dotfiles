return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
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
