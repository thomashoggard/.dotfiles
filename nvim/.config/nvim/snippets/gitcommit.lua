local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local conventionalCommit = s("cc", fmt([[
{}{}: {}
]], {
  i(1, "type"),
  c(2, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(3, "title"),
}))
table.insert(snippets, conventionalCommit)

local fixConventionalCommit = s("fix", fmt([[
fix{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, fixConventionalCommit)

local featConventionalCommit = s("feat", fmt([[
feat{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, featConventionalCommit)

local buildConventionalCommit = s("build", fmt([[
build{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, buildConventionalCommit)

local choreConventionalCommit = s("chore", fmt([[
chore{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, choreConventionalCommit)

local docsConventionalCommit = s("docs", fmt([[
docs{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, docsConventionalCommit)

local refactorConventionalCommit = s("refactor", fmt([[
refactor{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, refactorConventionalCommit)

local performanceConventionalCommit = s("perf", fmt([[
perf{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
  i(2, "title"),
}))
table.insert(snippets, performanceConventionalCommit)

local testConventionalCommit = s("test", fmt([[
test{}: {}
]], {
  c(1, { t(""), fmt([[({})]], { i(1, "scope") }) }),
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
