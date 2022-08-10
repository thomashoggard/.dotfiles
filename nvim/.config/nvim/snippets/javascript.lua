local ls = require "luasnip"

local s = ls.s --> snippet
local i = ls.i --> insert node
local fmta = require("luasnip.extras.fmt").fmta

local snippets, autosnippets = {}, {}

local export = s("export", fmta([[
export { <> } from "./<>";
]], {
  i(2, ""),
  i(1, ""),
}))
table.insert(snippets, export)

local import = s("import", fmta([[
import { <> } from "<>";
]], {
  i(2, ""),
  i(1, ""),
}))
table.insert(snippets, import)

local log = s("log", fmta([[
console.log(<>);
]], {
  i(1, ""),
}))
table.insert(snippets, log)
--
local func = s("func", fmta([[
function <>() {
  <> 
}
]], {
  i(1, ""),
  i(2, ""),
}))
table.insert(snippets, func)

return snippets, autosnippets
