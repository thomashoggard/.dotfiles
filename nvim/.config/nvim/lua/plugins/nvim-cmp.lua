return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lua" },
    -- Snippets
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip" },
    -- Adds VSCode pictograms to cmp.
    { "onsails/lspkind-nvim" },
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    cmp.setup({
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }),
      mapping = cmp.mapping.preset.insert({
        -- Select first item if none are selected.
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-h>"] = function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
        ["<C-l>"] = function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end,
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
        }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline({
        -- `c = ...` is a temporary workaround - https://github.com/hrsh7th/nvim-cmp/issues/1835
        -- Select first item if none are selected.
        ["<C-y>"] = { c = cmp.mapping.confirm({ select = true }) },
      }),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        -- `c = ...` is a temporary workaround - https://github.com/hrsh7th/nvim-cmp/issues/1835
        -- Select first item if none are selected.
        ["<C-y>"] = { c = cmp.mapping.confirm({ select = true }) },
      }),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
