-- Plugin definition and loading
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'ayu-theme/ayu-vim'
  use 'catppuccin/nvim'
  use 'sainnhe/sonokai'
  use 'yonlu/omni.vim'

  -- Colorizations
  use 'p00f/nvim-ts-rainbow'
  use 'chrisbra/Colorizer' -- Color previews for hex, rgb, hsl values.
  use 'unblevable/quick-scope' -- Always-on highlight for a unique char in every word for f,F and family


  -- Formatting
  use 'jiangmiao/auto-pairs' -- Insert or delete brackets, params, quotes in pair.
  use 'tpope/vim-surround'
  use {
    'numToStr/Comment.nvim', -- comment out lines
    config = function() require('Comment').setup() end
  }

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use({
    'f-person/git-blame.nvim', -- Shows virtual text for each line showing commit history.
    config = function() require('plugins.gitblame') end
  })

  -- LSP server
  use({
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  })
  use 'williamboman/nvim-lsp-installer' -- Helper for installing most language servers

  use 'folke/trouble.nvim' -- Show linting errors in a panel
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use 'onsails/lspkind-nvim' -- Adds vscode-like pictograms to neovim build-in lsp.
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- Utils to improve the TypeScript development experience.
  -- use 'glepnir/lspsaga.nvim'

  -- Autocomplete
  use 'L3MON4D3/LuaSnip' -- Snippet engine

  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require('plugins.cmp') end,
  })

  use({'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'})

  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end,
  })

  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,  -- Must add this manually
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end,
  })

  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'junegunn/fzf.vim'
  use 'davidgranstrom/nvim-markdown-preview'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
