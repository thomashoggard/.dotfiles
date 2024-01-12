local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
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
