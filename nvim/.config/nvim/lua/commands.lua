-- Open :h documentation in vertical buffer.
vim.api.nvim_command("autocmd FileType help wincmd L")

-- Automatically resize windows when screen changes size.
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.api.nvim_command('wincmd =')
  end
})
