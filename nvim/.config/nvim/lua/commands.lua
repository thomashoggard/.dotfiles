-- Open :h documentation in vertical buffer.
vim.api.nvim_command("autocmd FileType help wincmd L")

-- Automatically resize windows when screen changes size.
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("auto-window-resize", { clear = true }),
  callback = function()
    vim.api.nvim_command('wincmd =')
  end
})

-- Highlight yanked text for a brief amount of time.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = (vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'),
      timeout = 300
    })
  end
})

-- Take camel case into consideration for spell checker
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("spell", { clear = true }),
  callback = function()
    vim.opt_local.spelloptions:append("camel")
  end
})
