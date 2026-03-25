---
name: wt
description: Use the wt (Worktrunk) CLI to manage git worktrees for parallel AI agent workflows
---

## What I do

Worktrunk (`wt`) is a CLI for git worktree management. It makes worktrees as easy as branches, designed for running multiple AI agents in parallel. Each worktree gets its own working directory so agents don't step on each other's changes.

## Core commands

### wt switch
Switch to a worktree (or create one). This is the primary command.

```bash
wt switch feature-auth           # Switch to existing worktree
wt switch -                      # Previous worktree (like cd -)
wt switch ^                      # Default branch worktree
wt switch --create new-feature   # Create new branch and worktree
wt switch --create hotfix --base production  # Branch from specific base
wt switch pr:123                 # Switch to PR #123's branch
wt switch mr:101                 # Switch to GitLab MR !101's branch
wt switch                        # Interactive picker (no args)
```

**Key flags:**
- `-c / --create` — create new branch
- `-b / --base <BASE>` — base branch (defaults to default branch)
- `-x / --execute <CMD>` — run command after switch (e.g. launch editor or agent)
- `--no-cd` — skip directory change (for automation)
- `-y / --yes` — skip approval prompts
- `--no-verify` — skip hooks

**Shortcuts:** `^` = default branch, `@` = current, `-` = previous, `pr:{N}` = GitHub PR, `mr:{N}` = GitLab MR

### wt list
Show all worktrees with status (staged changes, ahead/behind, CI status, etc.)

```bash
wt list                          # Summary view
wt list --full                   # Full view including CI, PR links
wt list --branches               # Include branches without worktrees
wt list --format=json            # JSON output for scripting
```

### wt remove
Remove a worktree and its branch.

```bash
wt remove                        # Remove current worktree
wt remove feature-auth           # Remove specific worktree
wt remove @                      # Remove current (shortcut)
```

### wt merge
Squash, rebase, fast-forward merge to default branch, then clean up — all in one command.

```bash
wt merge main                    # Merge current worktree into main
wt merge main --no-commit        # Merge without auto-commit
```

### wt step
Utility steps for worktree workflows.

```bash
wt step commit                   # Commit staged changes (with optional LLM message)
wt step copy-ignored             # Copy gitignored files from another worktree (eliminates cold starts)
```

### wt hook
View and manage hooks.

```bash
wt hook list                     # List configured hooks
wt hook run post-create          # Run a hook manually
```

### wt config
View and manage configuration.

```bash
wt config state default-branch          # Show detected default branch
wt config state marker set "🚧"         # Set status marker for current branch
wt config state marker set "✅" --branch feat  # Set for specific branch
wt config shell install                 # Install shell integration (required for cd)
wt config state logs get --hook=user:post-start:server  # Get hook log path
```

## Hooks (wt.toml / config.toml)

Hooks automate tasks when creating, starting, merging, or removing worktrees. Configure in `.config/wt.toml` (project) or `~/.config/worktrunk/config.toml` (global).

Hook types:
- `post-create` — after worktree is created (blocking, before `--execute`)
- `post-start` — after switch, runs in background
- `pre-merge` — before merge (failure aborts)
- `post-merge` — after successful merge
- `pre-remove` — before removal
- `post-remove` — after removal

Template variables available in hooks: `{{ branch }}`, `{{ worktree_path }}`, `{{ repo }}`, `{{ base }}`, `{{ base_worktree_path }}`

Filters: `{{ branch | sanitize }}` (shell-safe name), `{{ branch | hash_port }}` (stable port 10000-19999), `{{ branch | sanitize_db }}` (DB-safe identifier)

Example:
```toml
[post-start]
copy = "wt step copy-ignored"
server = "npm run dev -- --port {{ branch | hash_port }}"

[pre-merge]
lint = "npm run lint"
test = "npm run test"

[pre-remove]
server = "lsof -ti :{{ branch | hash_port }} -sTCP:LISTEN | xargs kill 2>/dev/null || true"
```

## Common patterns

### Launch agent in new worktree
```bash
# Create worktree and immediately launch opencode/claude
wt switch --create feature-auth -x opencode
wt switch --create fix-bug -x claude -- 'Fix the login bug described in issue #42'

# Alias for quick agent spawning
alias wsc='wt switch --create --execute=opencode'
wsc new-feature
```

### Parallel agents
```bash
wt switch -x opencode -c feature-a -- 'Add user authentication'
wt switch -x opencode -c feature-b -- 'Fix the pagination bug'
wt switch -x opencode -c feature-c -- 'Write tests for the API'
```

### Agent handoff (background via tmux)
```bash
tmux new-session -d -s fix-auth "wt switch --create fix-auth -x opencode -- \
  'Fix the session timeout bug — extend from 5 min to 24 hours'"
```

### PR workflow
```bash
wt step commit                   # Commit staged changes
gh pr create                     # Open PR
wt remove                        # After PR merged, clean up
```

### Local merge workflow
```bash
wt merge main                    # Squash, rebase, fast-forward, clean up
```

### Eliminate cold starts
```toml
# .config/wt.toml
[post-start]
copy = "wt step copy-ignored"    # Copies node_modules, target/, .env, etc.
```

### Stacked branches
```bash
wt switch --create feature-part2 --base=@   # Branch from current HEAD
```

## When to use me

- When the user wants to create a new worktree for a task
- When managing multiple parallel agent sessions
- When setting up hooks for automation (dev servers, DB, CI gates)
- When merging or cleaning up worktrees
- When checking status of branches/worktrees across a repo
- When troubleshooting wt configuration or shell integration

## Shell integration note

`wt switch` requires shell integration to actually `cd` into the new directory:
```bash
wt config shell install          # Run once after install
```
Without it, the worktree is created but the shell doesn't change directories.
