return {
  "saghen/blink.cmp",
  version = "1.*", -- pin to v1 (v2 in development requires blink.lib)
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
  },
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = "luasnip" },

    keymap = {
      preset = "default", -- C-y accept, C-Space open menu, C-n/C-p select, C-e hide
      ["<C-h>"] = { "snippet_backward", "fallback" },
      ["<C-l>"] = { "snippet_forward", "fallback" },
    },

    cmdline = {
      -- Inherit insert-mode keymap so C-y/C-h/C-l work in cmdline too.
      keymap = {
        preset = "inherit",
        ["<C-y>"] = { "select_and_accept" },
      },
      completion = {
        menu = { auto_show = true },
        list = { selection = { preselect = false, auto_insert = true } },
      },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      list = { selection = { preselect = false, auto_insert = true } },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = { enabled = true },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
