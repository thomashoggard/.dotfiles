local ls = require "luasnip"

local s = ls.s --> snippet
local i = ls.i --> insert node
local fmta = require("luasnip.extras.fmt").fmta

local snippets, autosnippets = {}, {}

local importType = s("import type", fmta([[
import type { <> } from "<>";
]], {
  i(2, ""),
  i(1, ""),
}))
table.insert(snippets, importType)

return snippets, autosnippets
