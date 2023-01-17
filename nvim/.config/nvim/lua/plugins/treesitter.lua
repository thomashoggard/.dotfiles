return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
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
