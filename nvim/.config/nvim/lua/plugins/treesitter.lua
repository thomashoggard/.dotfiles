require('nvim-treesitter.configs').setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true
  },
})
