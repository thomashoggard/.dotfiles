return {
  cmd = { "pkl-lsp" },
  filetypes = { "pkl" },
  root_dir = require("lspconfig").util.find_git_ancestor,
}
