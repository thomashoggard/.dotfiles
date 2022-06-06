require("neogit").setup({
  enhanced_diff_hl = false,
  disable_commit_confirmation = true,
  integrations = {
    diffview = true,
  },
  sections = {
    untracked = {
      folded = true
    },
    unstaged = {
      folded = true
    },
    staged = {
      folded = true
    },
    stashes = {
      folded = true
    },
    unpulled = {
      folded = true
    },
    unmerged = {
      folded = true
    },
    recent = {
      folded = true
    },
  },
})
