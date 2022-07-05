local ls = require "luasnip"

local s = ls.s --> snippet
local i = ls.i --> insert node
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local export = s("export", fmt([[
export {{{}}} from "./{}";
]], {
  i(2, ""),
  i(1, ""),
}))
table.insert(snippets, export)

local import = s("import", fmt([[
import {{{}}} from "{}";
]], {
  i(2, ""),
  i(1, ""),
}))
table.insert(snippets, import)

local importType = s("import type", fmt([[
import type {{{}}} from "{}";
]], {
  i(2, ""),
  i(1, ""),
}))
table.insert(snippets, importType)

local log = s("log", fmt([[
console.log({});
]], {
  i(1, ""),
}))
table.insert(snippets, log)

return snippets, autosnippets
