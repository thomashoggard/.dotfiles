return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = true },
      bufdelete = { enabled = true },
      snacks = { enabled = true },
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
          "<leader>gg",
          function()
            snacks.lazygit()
          end,
          desc = "Lazygit",
        },
        {
          "<leader>gl",
          function()
            require("snacks").lazygit.log()
          end,
          desc = "Lazygit Log (cwd)",
        },
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
        -- {
        --   "<leader>.",
        --   function()
        --     snacks.scratch()
        --   end,
        --   desc = "Toggle Scratch Buffer",
        -- },
        -- {
        --   "<leader>S",
        --   function()
        --     snacks.scratch.select()
        --   end,
        --   desc = "Select Scratch Buffer",
        -- },
      }
    end,
  },
}
