-- Open :h documentation in vertical buffer.
vim.api.nvim_command("autocmd FileType help wincmd L")

-- Automatically resize windows when screen changes size.
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.api.nvim_command('wincmd =')
  end
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

-- Take camel case into consideration for spell checker
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.spelloptions:append("camel")
  end
})
