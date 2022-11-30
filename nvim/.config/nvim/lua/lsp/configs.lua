local lspconfig = require("lspconfig")
local handlers = require("lsp.handlers")

local servers = {
  "tsserver",
  "jsonls",
  "sumneko_lua",
  "eslint", -- not maintained
  "prismals",
  "html",
  "bashls",
  "yamlls",
  "dockerls",
  "denols"
}

local tools = {
  "prettierd",
  "eslint_d", -- do we need this since we are using eslint ls?
  "shfmt"
}

require("mason").setup()

-- Install LSP servers
require("mason-lspconfig").setup({
  ensure_installed = servers
})

-- Install 3rd party tools
require('mason-tool-installer').setup {
  ensure_installed = tools
}


for _, server in pairs(servers) do
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)

  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end

  lspconfig[server].setup(opts)
end
