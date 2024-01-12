local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
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

-- local useContext = s("uc", fmt([[
-- export type Context = {} | undefined;
--
-- const {}Context = React.createContext<Context>(undefined);
--
-- export const {}Provider = {}Context.Provider;
--
-- export function use{}() {{
--   const context = React.useContext({}Context);
--   if (context === undefined) {{
--     throw new Error('use{} must be used within a {}Provider');
--   }}
--   return context;
-- }}
-- ]], {
--   i(2, ""),
--   i(1, ""),
--   rep(2),
--   rep(2),
--   rep(2),
--   rep(2),
--   rep(2),
-- }))
-- table.insert(snippets, useContext)

return snippets, autosnippets
