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

-- Stop nvim from adding a comment to a new line when using 'o' or 'O'.
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt_local.formatoptions:remove("o")
  end
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end
})

-- Format the current buffer
vim.api.nvim_create_user_command("Format",
  function()
    vim.lsp.buf.format()
  end,
  {}
)

-- Save the current buffer without running the autocmd formatter.
vim.api.nvim_create_user_command("SaveWithoutFormat",
  function()
    vim.api.nvim_exec('noautocmd w', false)
  end,
  {}
)

-- Switches the colorscheme to light mode.
vim.api.nvim_create_user_command("Light",
  function()
    vim.o.background = "light"
    vim.cmd [[colorscheme gruvbox-material]]
  end,
  {}
)

-- Switches the colorscheme to dark mode.
vim.api.nvim_create_user_command("Dark",
  function()
    vim.o.background = "dark"
    vim.cmd [[colorscheme catppuccin]]
  end,
  {}
)

-- Delete all buffers
vim.api.nvim_create_user_command("Bd",
  function()
    vim.cmd [[%bd]]
  end,
  {}
)

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})
