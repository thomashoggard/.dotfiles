# Claude Code dotfiles

Stows skills and a declarative list of user-scope MCP servers into `~/.claude/`.

## Contents

- `.claude/skills/` — user-scope skills (`find-docs`, `linear`).
- `.claude/mcp-servers.json` — declarative source of truth for user-scope MCP servers.

## MCP servers

Claude Code reads user-scope MCPs from `~/.claude.json`, which is a runtime state
file we don't sync (it contains OAuth tokens, project history, caches, etc.).

`mcp-servers.json` is just a portable reference list. On a new machine, ask Claude
Code to register them:

> Read `~/.claude/mcp-servers.json` and add each entry via
> `claude mcp add-json --scope user <name> <json>`.

Then verify with `claude mcp list`.
