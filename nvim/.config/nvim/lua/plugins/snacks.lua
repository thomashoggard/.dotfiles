return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = true },
      bufdelete = { enabled = true },
    },
    keys = function()
      local snacks = require("snacks")

      return {
        {
          "<leader>gf",
          function()
            snacks.lazygit.log_file()
          end,
          desc = "Lazygit Current File History",
        },
        {
          "<leader>lg",
          function()
            snacks.lazygit()
          end,
          desc = "Lazygit",
        },
        -- { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Log (cwd)", },
        {
          "<leader>q",
          function()
            snacks.bufdelete()
          end,
        },
        {
          "<leader>w",
          function()
            snacks.bufdelete.all()
          end,
        },
      }
    end,
  },
}
