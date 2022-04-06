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
  use 'Shatur/neovim-ayu'
  use 'catppuccin/nvim'
  use 'sainnhe/sonokai'
  use 'yonlu/omni.vim'
  use 'folke/tokyonight.nvim'
  use "rebelot/kanagawa.nvim"

  -- Colorizations
  use 'folke/lsp-colors.nvim'
  use 'p00f/nvim-ts-rainbow'
  use 'chrisbra/Colorizer' -- Color previews for hex, rgb, hsl values.
  use({
    'lewis6991/spellsitter.nvim', -- Add tree-sitter highlighting to misspelled words.
    config = function() require('spellsitter').setup() end
  })
  use({
    'lukas-reineke/indent-blankline.nvim', -- Add indentation line guides.
    config = function() require('plugins.indent-blankline') end
  })

  -- Movement
  use 'unblevable/quick-scope' -- Always-on highlight for a unique char in every word for f,F and family

  -- Formatting
  use({
    'windwp/nvim-autopairs', -- Insert or delete brackets, params, quotes in pair.
    config = function() require('nvim-autopairs').setup() end
  })

  use 'tpope/vim-surround'
  use({
    'numToStr/Comment.nvim', -- Comment out lines.
    config = function() require('Comment').setup() end
  })

  -- git
  use 'tpope/vim-fugitive'
  use({
    'lewis6991/gitsigns.nvim', -- Git blame virtual text, code change markers.
    config = function() require("plugins.gitsigns") end
  })
  use({ 
    'TimUntersberger/neogit', 
    requires = 'nvim-lua/plenary.nvim',
    config = function() require("plugins.neogit") end
  })
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- LSP server
  use({
    'neovim/nvim-lspconfig', -- Collection of configs for built-in LSP client.
    config = function() require('lsp') end
  })
  use 'williamboman/nvim-lsp-installer' -- Helper for installing most language servers

  use 'folke/trouble.nvim' -- Show linting errors in a panel
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use 'onsails/lspkind-nvim' -- Adds vscode-like pictograms to neovim build-in lsp.
  use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- Utils to improve the TypeScript development experience.
  -- use 'glepnir/lspsaga.nvim'
  use({
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  })

  -- Autocomplete
  use 'L3MON4D3/LuaSnip' -- Snippet engine

  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua", -- Completion for nvim Lua runtime API, ex. vim.lsp.*
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp.
      "hrsh7th/cmp-nvim-lsp-signature-help", -- Highlight current parameter in function signature.
    },
    config = function() require('plugins.cmp') end,
  })

  -- Finish setting up.
  use({
    "kosayoda/nvim-lightbulb",
    config = function() require('plugins.nvim-lightbulb') end,
  })
  -- use({'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'})

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

  -- Waiting until it's a bit more stable
  -- use({
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim"
  --   },
  --   config = function () require('plugins.neotree') end,
  -- })
  
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
