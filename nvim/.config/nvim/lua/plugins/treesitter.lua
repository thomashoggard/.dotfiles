-- TODO: Review this config, ensure it still makes sense.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "javascript",
          "json",
          "lua",
          "typescript",
          "tsx",
          "css",
          "yaml",
          "dockerfile",
          "go",
          "markdown",
          "bash",
        },
        highlight = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
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
