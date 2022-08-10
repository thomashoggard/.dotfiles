local ls = require "luasnip"

local s = ls.s --> snippet
local i = ls.i --> insert node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}


local reactComponent = s("rc", fmta([[
type <>Props = {}

export function <>(props: <>Props) {
  return <<div>>placeholder<</div>>
}
]], {
  rep(1),
  i(1, ""),
  rep(1),
}))
table.insert(snippets, reactComponent)

local useState = s("us", fmta([[
const [<>, set<>] = React.useState(<>)
]], {
  i(1, "value"),
  i(2, "Value"),
  i(3, ""),
}))
table.insert(snippets, useState)

return snippets, autosnippets
