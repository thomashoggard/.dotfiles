return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icons = {
                code_block = {
                  conceal = true,
                  width = 'content'
                }
              }
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                league = "~/notes/league",
                personal = "~/notes/personal",
              },
              default_workspace = "league"
            },
          },
        },
      }
    end,
  },
}
