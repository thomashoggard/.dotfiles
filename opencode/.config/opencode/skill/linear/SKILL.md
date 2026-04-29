---
name: linear
description: >-
  Manage Linear issues, projects, teams, cycles, milestones, and more using
  the Linear CLI. Use this skill when the user asks to create, update, view,
  or list anything in Linear.
---

# Linear CLI

Interact with Linear using the `linear` CLI (v1.11.1+).

## Issue ID resolution

Many commands accept an optional `[issueId]`. If omitted, the CLI infers the
issue from the current git branch. Prefer omitting the ID when working on
the current branch.

```bash
linear issue id          # print issue ID from current branch
linear issue view        # view current branch's issue
linear issue describe    # print title + Linear trailer for commits
```

## Issues

```bash
# List your issues
linear issue list

# View an issue
linear issue view [issueId]
linear issue url [issueId]

# Create an issue
linear issue create \
  -t "Title" \
  -d "Description" \
  -p 1 \                      # priority: 1=urgent 2=high 3=medium 4=low
  -a self \                   # assignee: 'self' or username
  --state "In Progress" \
  --project "Project Name" \
  --cycle active \
  --milestone "Milestone Name" \
  -l "bug" -l "frontend"      # labels (repeatable)

# Create with markdown description from file
linear issue create -t "Title" --description-file ./description.md

# Start working (moves to In Progress)
linear issue start [issueId]

# Update an issue
linear issue update [issueId] -s "Done"
linear issue update [issueId] -a self --priority 2

# Create a PR from the current issue
linear issue pull-request [issueId]

# Delete an issue
linear issue delete [issueId]
```

### Issue comments

```bash
linear issue comment list [issueId]
linear issue comment create [issueId] -b "Comment body"
```

### Issue relations

```bash
linear issue relation list [issueId]
linear issue relation create   # interactive
```

## Projects

```bash
linear project list
linear project view <projectId>
linear project create
linear project update <projectId>
linear project delete <projectId>
```

## Teams

```bash
linear team list
linear team id                   # print configured team ID
linear team members [teamKey]
```

## Cycles

```bash
linear cycle list                # list cycles for your team
linear cycle view <cycleRef>     # cycleRef = name, number, or 'active'
```

## Milestones

```bash
linear milestone list            # list milestones for a project
linear milestone view <id>
linear milestone create
linear milestone update <id>
linear milestone delete <id>
```

## Labels

```bash
linear label list
linear label create
linear label update <labelId>
linear label delete <labelId>
```

## Documents

```bash
linear document list
linear document view <docId>
linear document create
linear document update <docId>
linear document delete <docId>
```

## Raw GraphQL

```bash
# Run a raw GraphQL query (pipe a .graphql file or inline)
linear api "{ viewer { id name email } }"
linear api < query.graphql
```

## Auth

```bash
linear auth login     # authenticate
linear auth logout
linear auth status
```

## Config

```bash
# Generate a .linear.toml config for the current project
linear config

# Target a specific workspace
linear --workspace <slug> issue list
```

## Common workflows

**Start working on an issue from your list:**
```bash
linear issue list
linear issue start FI-123
```

**Create a bug report and assign to yourself:**
```bash
linear issue create -t "Bug: ..." -p 2 -a self -l "bug" --state "Todo"
```

**Update the current branch's issue to Done:**
```bash
linear issue update -s "Done"
```

**Check what issue the current branch maps to:**
```bash
linear issue describe
```
