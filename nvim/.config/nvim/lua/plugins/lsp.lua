return {
  {
    'VonHeikemen/lsp-zero.nvim',
    priority = 100, -- Ensure we setup LSP before other plugins like null-ls.
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'jayp0521/mason-null-ls.nvim',
        opts = {
          ensure_installed = { "prettierd", "eslint_d" },
        },
      },
      -- Adds VSCode pictograms to cmp.
      { "onsails/lspkind-nvim" },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      require('mason.settings').set({
        ui = {
          border = 'rounded'
        }
      })

      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.ensure_installed({
        "tsserver",
        "jsonls",
        "sumneko_lua",
        "prismals",
        "html",
      })

      lsp.setup()

      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
          }),
        },
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  }
}
