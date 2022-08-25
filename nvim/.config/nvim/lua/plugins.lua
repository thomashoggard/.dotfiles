-- Plugin definition and loading
local fn = vim.fn
local cmd = vim.cmd

-- Bootstrap Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

-- Rerun :PackerCompile every time plugins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Themes
  use("catppuccin/nvim")
  -- use("Shatur/neovim-ayu")
  use("sainnhe/gruvbox-material")
  -- use("olimorris/onedarkpro.nvim")
  -- use("sainnhe/sonokai")
  -- use("yonlu/omni.vim")
  -- use("folke/tokyonight.nvim")
  -- use("rebelot/kanagawa.nvim")
  -- use("EdenEast/nightfox.nvim")
  -- use("sainnhe/everforest")
  -- use 'navarasu/onedark.nvim'

  -- Colorizations
  use("folke/lsp-colors.nvim")
  use({ "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          -- ...
        },
        -- ...
        rainbow = {
          extended_mode = false,
        }
      }
    end, })
  use("chrisbra/Colorizer") -- Color previews for hex, rgb, hsl values.
  use({
    "lewis6991/spellsitter.nvim", -- Add tree-sitter highlighting to misspelled words.
    config = function()
      require("spellsitter").setup()
    end,
  })
  use({
    "lukas-reineke/indent-blankline.nvim", -- Add indentation line guides.
    config = function()
      require("plugins.indent-blankline")
    end,
  })

  use("numToStr/FTerm.nvim") -- Floating terminal

  -- Buffer Management
  -- use({
  --   "akinsho/bufferline.nvim",
  --   tag = "*",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("plugins.bufferline")
  --   end,
  -- })
  use("moll/vim-bbye") -- Delete buffers without closing it's window.

  -- Movement
  use("unblevable/quick-scope") -- Always-on highlight for a unique char in every word for f,F and family
  use({
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  })

  -- Formatting
  use({
    "windwp/nvim-autopairs", -- Insert or delete brackets, params, quotes in pair.
    config = function()
      require("nvim-autopairs").setup()
    end,
  })

  use({
    "windwp/nvim-ts-autotag", -- Automatically add and rename html tags.
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  })

  use("tpope/vim-surround")
  use({
    "numToStr/Comment.nvim", -- Comment out lines.
    config = function()
      require("plugins.comment")
    end,
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- git
  use("tpope/vim-fugitive")
  use({
    "lewis6991/gitsigns.nvim", -- Git blame virtual text, code change markers.
    config = function()
      require("plugins.gitsigns")
    end,
  })
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("plugins.neogit")
    end,
  })
  use('kdheepak/lazygit.nvim')
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use { 'akinsho/git-conflict.nvim', config = function()
    require('git-conflict').setup({
      default_mappings = true, -- disable buffer local mapping created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffText',
        current = 'DiffAdd',
      }

    })
  end }

  -- LSP server
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "WhoIsSethDaniel/mason-tool-installer.nvim" }) -- Automatically installs 3rd party tools

  use({
    "neovim/nvim-lspconfig", -- Collection of configs for built-in LSP client.
    config = function()
      require("lsp")
    end,
  })

  use("folke/trouble.nvim") -- Show linting errors in a panel
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use("onsails/lspkind-nvim") -- Adds vscode-like pictograms to neovim build-in lsp.
  use("jose-elias-alvarez/nvim-lsp-ts-utils") -- Utils to improve the TypeScript development experience.
  use("b0o/schemastore.nvim") -- Add https://github.com/b0o/schemastore.nvim types for JSON
  -- use 'glepnir/lspsaga.nvim'
  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })

  -- Autocomplete
  use({
    "L3MON4D3/LuaSnip", -- Snippet engine
    -- after = 'nvim-cmp',
    config = function()
      require("plugins.luasnip")
    end
  })

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
      -- "hrsh7th/cmp-nvim-lsp-signature-help", -- Highlight current parameter in function signature.
    },
    config = function()
      require("plugins.cmp")
    end,
  })

  use({
    "ray-x/lsp_signature.nvim", -- Highlight current parameter in function signature.
    config = function()
      require("lsp_signature").setup()
    end,
  })

  -- use({
  --   "rafamadriz/friendly-snippets",
  --   config = function()
  --     -- require("luasnip.loaders.from_vscode").lazy_load()
  --     require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } }) -- Load snippets from my-snippets folder
  --   end
  -- })


  -- Finish setting up.
  --use({
  --	"kosayoda/nvim-lightbulb",
  --	config = function()
  --		require("plugins.nvim-lightbulb")
  --	end,
  --})
  -- use({'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'})

  -- statusline
  use({
    "hoob3rt/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  })

  -- NvimTree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.nvimtree")
    end, -- Must add this manually
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter")
    end,
    run = ":TSUpdate",
  })

  use({
    'nvim-treesitter/nvim-treesitter-context', -- shows the context of the function as you scroll through the code.
    config = function()
      require("treesitter-context").setup({
        enable = true
      })
    end,
  });

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.telescope")
    end,
  })

  use("nvim-telescope/telescope-fzy-native.nvim")
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use("junegunn/fzf.vim")
  use("davidgranstrom/nvim-markdown-preview")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
