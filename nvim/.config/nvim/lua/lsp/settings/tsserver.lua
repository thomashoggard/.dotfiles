local lspconfig = require("lspconfig")

return {
  init_options = require("nvim-lsp-ts-utils").init_options,
  root_dir = lspconfig.util.root_pattern("package.json"),
}
