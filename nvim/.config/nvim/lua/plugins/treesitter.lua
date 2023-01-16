-- TODO: Review this config, ensure it still makes sense.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- TODO: Do I still need highlight, or is this a default?
        highlight = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
        },
      })
    end,
    build = ":TSUpdate",
  },
  {
    -- Shows the context of the function as you scroll through the code.
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require("treesitter-context").setup({
        enable = true
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  }
}
