" Great place to find plugins: https://neovimcraft.com/
let g:gitgutter_terminal_reports_focus=0

" Conditionally render a plugin 
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" VSCode Helper Functions
" ================================================================================
" Find in files with the currently selected text
function! FindInFiles() abort
  normal! gv

  let startPos = getpos("v")
  let endPos = getpos(".")

  call VSCodeNotifyRangePos("workbench.action.findInFiles", startPos[1], endPos[1], startPos[2], endPos[2]+1, 1)
endfunction

" Replace in files with the currently selected text
function! ReplaceInFiles() abort
  normal! gv

  let startPos = getpos("v")
  let endPos = getpos(".")

  call VSCodeNotifyRangePos("workbench.action.replaceInFiles", startPos[1], endPos[1], startPos[2], endPos[2]+1, 1)
endfunction


" Globals
" ================================================================================
" set clipboard=unnamedplus " Yanks text into system clipboard
set mouse=a               " Enable mouse scrolling

if exists('g:vscode')
  " VSCode specific globals
else
  set noswapfile
  set relativenumber " Show relative line numbers
  set number         " Show line numbers in the gutter
  set ignorecase 	   " Make searching case insensitive
  set smartcase      " ... unless the query has capital letters
  set nowrap         " Disable text wrap
  set splitright	" Split new vertical windows to the right
  set splitbelow 	" Split new horizontal windows to the bottom
  set cursorline  " highlight the line containing the cursor
  set expandtab shiftwidth=2 tabstop=2 softtabstop=2 " indentation
  set scrolloff=12
  set smartindent autoindent
  set completeopt=menu,menuone,noselect
endif


" Plugins
" ================================================================================ 
call plug#begin('~/.config/nvim/plugged')

" Insert or delete brackets, params, quotes in pair.
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Comment out lines
Plug 'numToStr/Comment.nvim'

Plug 'chrisbra/Colorizer' " Color previews for hex, rgb, hsl values.

Plug 'unblevable/quick-scope' " Always-on highlight for a unique char in every word for f,F and family
Plug 'folke/trouble.nvim' " Show linting errors in a panel

if exists('g:vscode')
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
endif

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" lsp 
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" snippet
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Advanced syntax highlighting
Plug 'p00f/nvim-ts-rainbow'

" files
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

" themes
Plug 'ayu-theme/ayu-vim'
Plug 'catppuccin/nvim'
Plug 'sainnhe/sonokai'
Plug 'yonlu/omni.vim'

call plug#end()

" Themeing
" ================================================================================
set termguicolors
" let ayucolor="dark"
 " colorscheme ayu

" let g:sonokai_style = 'maia'
" let g:sonokai_enable_italic = 1
"
"  colorscheme omni
"
" Key bindings
" ================================================================================
if exists('g:vscode')
  xnoremap <Leader>f <Esc>:call FindInFiles()<CR><Esc>
  xnoremap <Leader>r <Esc>:call ReplaceInFiles()<CR><Esc>
else
  let mapleader = ' ' " change leader key from '\' to ' '

  inoremap jk <esc>

  " Strong left & right
  nnoremap H _
  nnoremap L $

  " files & search
  nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
  nnoremap <C-n> :NvimTreeToggle<CR>
  nnoremap <leader>r :NvimTreeRefresh<CR>
  nnoremap <leader>n :NvimTreeFindFile<CR>

  " Window
  noremap <silent> <Up> :resize +5<CR>
  noremap <silent> <Down> :resize -5<CR>
  noremap <silent> <Right> :vertical resize -20<CR>
  noremap <silent> <Left> :vertical resize +20<CR>

  " Find files using Telescope command-line sugar.
  nnoremap <C-p> <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  " takes current selection and puts into telescope
  vnoremap <leader>fg "zy:Telescope live_grep default_text=<C-r>z<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  " Make current file executable
  nnoremap <leader>x :!chmod +x %<CR>

  " Reload nvim config
  nnoremap <leader><CR> :so $VIM_CONFIG<CR>

  " quickfixlist
  nnoremap <C-j> :cnext<CR>
  nnoremap <C-k> :cprev<CR>

  " Move lines up or down
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

  " Copy & Paste
  nnoremap <leader>p o<esc>Pk<CR>
  vnoremap <leader>p "_dP
  vnoremap <leader>y "+y
  nnoremap <leader>y "+y
  nnoremap <leader>Y gg"+yG

  " git
  nmap <leader>gs :Git<CR>
  nmap <leader>gl :Git log<CR>
  nmap <leader>gc :Git commit<CR>
  nmap <leader>gb :Git switch 
  nmap <leader>gp :Git push<CR>
  nmap <leader>gP :Git pull<CR>
  nmap <leader>gf :diffget //2<CR>
  nmap <leader>gj :diffget //3<CR>
endif

lua << EOF
  local catppuccin = require("catppuccin")

  -- configure it
  catppuccin.setup(
      {
          transparent_background = false,
          styles = {
              comments = "NONE",
              functions = "NONE",
              keywords = "NONE",
              strings = "NONE",
              variables = "NONE",
          },
          integrations = {
              treesitter = true,
              native_lsp = {
                  enabled = true,
                  virtual_text = {
                      errors = "italic",
                      hints = "italic",
                      warnings = "italic",
                      information = "italic",
                  },
                  underlines = {
                      errors = "underline",
                      hints = "underline",
                      warnings = "underline",
                      information = "underline",
                  },
              },
              lsp_trouble = true,
              lsp_saga = true,
              gitgutter = true,
              gitsigns = true,
              telescope = true,
              nvimtree = {
                  enabled = true
              },
              bufferline = true,
              markdown = true,
              ts_rainbow = true,
              hop = true,
          },
      }
  )

  vim.cmd[[colorscheme catppuccin]]

  require'nvim-tree'.setup {
    view = {
      relativenumber = true,
    },
  }

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", 
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true, 
      max_file_lines = nil, 
    }
  }

  -- Setup nvim-cmp.
  local tabnine = require('cmp_tabnine.config')
  tabnine:setup({
      max_lines = 1000,
      max_num_results = 20,
      sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
  })

  local saga = require 'lspsaga'
  saga.init_lsp_saga()

  local lspkind = require('lspkind')

  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) 
      end,
    },
    mapping = {
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true}),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      })
    },
    sources = {
      { name = "cmp_tabnine" },
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, 
      { name = 'buffer' },
    },
    formatting = {
      format = lspkind.cmp_format({with_text = true, menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })}),
    },
    experimental = {
      ghost_text = true
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Configure telescope
  require('telescope').load_extension('fzy_native')

  -- Setup lspconfig.
  local lspconfig = require("lspconfig")

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local buf_map = function(bufnr, mode, lhs, rhs, opts)
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
          silent = true,
      })
  end

  local on_attach = function(client, bufnr)
      vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
      vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
      vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
      vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
      vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
      vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
      vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
      vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
      vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
      vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
      vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
      vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
      buf_map(bufnr, "n", "gd", ":LspDef<CR>")
      buf_map(bufnr, "n", "gr", ":LspRename<CR>")
      buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
      buf_map(bufnr, "n", "K", ":LspHover<CR>")
      buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
      buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
      buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
      buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
      buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
      if client.resolved_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      end
  end

  lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false

          -- Does this formatting block do anything now that we configure formatting below in null-ls?
          local ts_utils = require("nvim-lsp-ts-utils")
          ts_utils.setup({
              eslint_bin = "eslint_d",
              eslint_enable_diagnostics = true,
              eslint_enable_code_actions = true,
              enable_formatting = true,
              formatter = "prettier",
          })
          ts_utils.setup_client(client)

          buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
          buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
          buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")

          on_attach(client, bufnr)
      end,
  })


  local null_ls = require("null-ls")
  local b = null_ls.builtins

  local sources = {
    -- Html,css,json
    b.formatting.prettierd,
    -- [java|type]script(react)?
    -- b.formatting.fixjson,
    b.diagnostics.eslint_d,
    b.formatting.eslint_d,
    b.code_actions.eslint_d,
    -- Lua
    b.diagnostics.luacheck.with({
        extra_args = { "--globals", "vim", "describe" },
    }),
    b.formatting.stylua,
    -- Bash,zsh
    b.formatting.shfmt.with({ extra_args = { "-i", "2", "-ci" } }),
    b.diagnostics.shellcheck,
    -- Vim
    b.diagnostics.vint,
    -- Yaml
    b.diagnostics.yamllint,
    -- Misc
    b.code_actions.gitsigns,
    b.hover.dictionary,
  }

  null_ls.setup({
    on_attach = on_attach,
    sources = sources
  })

  require'lualine'.setup()
  require'Comment'.setup()
EOF

