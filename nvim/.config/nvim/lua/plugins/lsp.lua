return {
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Adds VSCode pictograms to cmp.
      { "onsails/lspkind-nvim" },
      -- Show function signatures when you type.
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          require("lsp_signature").setup()
        end,
      },
      -- Add https://github.com/b0o/schemastore.nvim types for JSON
      { "b0o/schemastore.nvim" },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      require('mason.settings').set({
        ui = {
          border = 'rounded'
        }
      })

      local lsp = require('lsp-zero').preset({
        name = 'recommended',
        set_lsp_keymaps = {
          omit = { 'gi' },
        },
      })

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.ensure_installed({
        "tsserver",
        "bashls",
        "jsonls",
        "lua_ls",
        "html",
      })

      vim.diagnostic.config({
        virtual_text = false,
      })

      require('lspconfig').tsserver.setup({
        root_dir = require('lspconfig.util').root_pattern('.git')
      })

      -- Configure sumneko_lua to understand nvim config files.
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- Connect json LSP to JSON schemastore.
      require('lspconfig').jsonls.setup({
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        }
      })

      lsp.setup()

      -- Configure cmp
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = require('lspkind').cmp_format({
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
