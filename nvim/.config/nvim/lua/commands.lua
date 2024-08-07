-- Open :h documentation in vertical buffer.
vim.api.nvim_command("autocmd FileType help wincmd L")

-- Automatically resize windows when screen changes size.
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.api.nvim_command("wincmd =")
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Take camel case into consideration for spell checker
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.spelloptions:append("camel")
  end,
})

-- Stop nvim from adding a comment to a new line when using 'o' or 'O'.
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt_local.formatoptions:remove("o")
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
    -- vim.lsp.buf.format()
  end,
})

-- Format the current buffer
vim.api.nvim_create_user_command("Format", function(args)
  require("conform").format({ bufnr = args.buf })
  -- vim.lsp.buf.format()
end, {})

-- Save the current buffer without running the autocmd formatter.
vim.api.nvim_create_user_command("SaveWithoutFormat", function()
  vim.api.nvim_exec("noautocmd w", false)
end, {})

-- Switches the colorscheme to light mode.
vim.api.nvim_create_user_command("Light", function()
  vim.o.background = "light"
  vim.cmd([[colorscheme gruvbox-material]])
end, {})

-- Switches the colorscheme to dark mode.
vim.api.nvim_create_user_command("Dark", function()
  vim.o.background = "dark"
  vim.cmd([[colorscheme catppuccin]])
end, {})

-- Delete all buffers
vim.api.nvim_create_user_command("Bd", function()
  vim.cmd([[%bd]])
end, {})

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
})

-- Show the code actions menu
vim.api.nvim_create_user_command("CodeActionMenu", function()
  vim.lsp.buf.code_action()
end, {})
