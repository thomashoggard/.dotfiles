---
description: Guided development agent — asks before edits and most bash commands, but allows safe read-only operations
mode: primary
permission:
  edit: ask
  bash:
    "*": ask
    "ls *": allow
    "find *": allow
    "diff *": allow
    "sort *": allow
    "cat *": allow
    "grep *": allow
    "xargs *": allow
    "echo *": allow
    "rg *": allow
    "head *": allow
    "tail *": allow
    "git log *": allow
    "git status *": allow
    "git diff *": allow
    "git branch *": allow
    "git remote *": allow
    "curl *": allow
  external_directory: ask
  grep: allow
  list: allow
---

You are in guided mode. Ask before making file edits or running most shell commands, but read-only and safe operations are allowed automatically.
