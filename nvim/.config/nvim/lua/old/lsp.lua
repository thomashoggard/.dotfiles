return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      -- TODO: Is there a way to tell lazy.nvim that "mason" is the setup we should call.
      require("mason").setup()
    end,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Automatically installs 3rd party tools
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim" }, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  { "onsails/lspkind-nvim" }, -- Adds vscode-like pictograms to neovim build-in lsp.
  { "jose-elias-alvarez/nvim-lsp-ts-utils" }, -- Utils to improve the TypeScript development experience.
  { "b0o/schemastore.nvim" }, -- Add https://github.com/b0o/schemastore.nvim types for JSON
  {
    -- Collection of configs for built-in LSP client.
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local cmp = require("cmp")

      local border = {
        { "╭", "CmpBorder" },
        { "─", "CmpBorder" },
        { "╮", "CmpBorder" },
        { "│", "CmpBorder" },
        { "╯", "CmpBorder" },
        { "─", "CmpBorder" },
        { "╰", "CmpBorder" },
        { "│", "CmpBorder" },
      }

      cmp.setup({
        window = {
          documentation = {
            border = border,
          },
          completion = {
            border = border,
            winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
          },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-k>"] = cmp.mapping(function()
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            end
          end, { "i", "s" }),
          ["<C-j>"] = cmp.mapping(function()
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.choice_active() then
              luasnip.change_choice(-1)
            end
          end, { "i", "s" }),
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
          }),
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline" },
          { name = "nvim_lua" },
          { name = "nvim_lsp_signature_help" },
        },
      })

      -- Use completion for `:` commands.
      cmp.setup.cmdline(":", {
        sources = {
          { name = "cmdline" },
        },
      })

      -- Use completion for `/` searches.
      cmp.setup.cmdline("/", {
        sources = {
          { name = "buffer" },
        },
      })
    end,
  }
}
