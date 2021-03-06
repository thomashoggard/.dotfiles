local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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

    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    -- ["<Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ["S-Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end,
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
    -- { name = 'tzachar/cmp-tabnine' },
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

-- AI assistant (replace with codecov somehow)
-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
--     max_lines = 1000,
--     max_num_results = 20,
--     sort = true,
--   run_on_every_keystroke = true,
--   snippet_placeholder = '..',
-- })
