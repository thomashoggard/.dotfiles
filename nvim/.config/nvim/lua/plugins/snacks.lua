return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {},
    },
    keys = {
      {
        "<leader>gf",
        function()
          require("snacks").lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>lg",
        function()
          require("snacks").lazygit()
        end,
        desc = "Lazygit",
      },
      -- {
      --   "<leader>gl",
      --   function()
      --     require("snacks").lazygit.log()
      --   end,
      --   desc = "Lazygit Log (cwd)",
      -- },
    },
  },
}
