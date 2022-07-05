local ls = require "luasnip"

local s = ls.s --> snippet
local i = ls.i --> insert node
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local conventionalCommit = s("cc", fmt([[
{}({}): {}
]], {
  i(1, "type"),
  i(2, "scope"),
  i(3, "title"),
}))
table.insert(snippets, conventionalCommit)

local fixConventionalCommit = s("fix", fmt([[
fix({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, fixConventionalCommit)

local featConventionalCommit = s("feat", fmt([[
feat({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, featConventionalCommit)

local buildConventionalCommit = s("build", fmt([[
build({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, buildConventionalCommit)

local choreConventionalCommit = s("chore", fmt([[
chore({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, choreConventionalCommit)

local docsConventionalCommit = s("docs", fmt([[
docs({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, docsConventionalCommit)

local refactorConventionalCommit = s("refactor", fmt([[
refactor({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, refactorConventionalCommit)

local performanceConventionalCommit = s("perf", fmt([[
perf({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, performanceConventionalCommit)

local testConventionalCommit = s("test", fmt([[
test({}): {}
]], {
  i(1, "scope"),
  i(2, "title"),
}))
table.insert(snippets, testConventionalCommit)

local breakConventionalCommit = s("break", fmt([[
BREAKING CHANGE: {}
]], {
  i(1, ""),
}))
table.insert(snippets, breakConventionalCommit)

return snippets, autosnippets
