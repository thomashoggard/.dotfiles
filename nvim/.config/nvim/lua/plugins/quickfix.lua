-- Pretty quickfix list.
-- NOTE: Unmaintained (last commit Aug 2024). Works fine, revisit if issues arise.
return {
  "yorickpeterse/nvim-pqf",
  config = function()
    require("pqf").setup()
  end,
}
