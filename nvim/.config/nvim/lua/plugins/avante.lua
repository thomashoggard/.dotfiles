-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   version = false,
--   opts = {
--     provider = "copilot",
--     providers = {
--       claude = {
--         endpoint = "https://api.anthropic.com",
--         model = "claude-3-5-sonnet-20241022",
--       },
--     },
--   },
--   build = "make",
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           use_absolute_path = true,
--         },
--       },
--     },
--   },
-- }

return {
  {
    "zbirenbaum/copilot.lua",
    -- lazy = true,
    -- event = { "InsertEnter" },
    cmd = { "Copilot" },
    config = function()
      require("copilot").setup({
        -- suggestion = { enabled = false },
        -- panel = { enabled = false },
      })
    end,
  },
}

-- return {
--   "olimorris/codecompanion.nvim",
--   opts = {},
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--   },
-- }
