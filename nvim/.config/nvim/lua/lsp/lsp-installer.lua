local lsp_installer = require("nvim-lsp-installer")
local handlers = require("lsp.handlers")

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server.name == "tsserver" then
    local tsserver_opts = require("lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls = require("lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)
