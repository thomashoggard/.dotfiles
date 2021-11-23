" Great place to find plugins: https://neovimcraft.com/


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
set clipboard=unnamedplus " Yanks text into system clipboard
set mouse=a               " Enable mouse scrolling

if exists('g:vscode')
  " VSCode specific globals
else
  set rnu    " Show relative line numbers
  set number " Show line numbers in the gutter
endif


" Key bindings
" ================================================================================
if exists('g:vscode')
  xnoremap <Leader>f <Esc>:call FindInFiles()<CR><Esc>
  xnoremap <Leader>r <Esc>:call ReplaceInFiles()<CR><Esc>
else
  let mapleader = ' ' " change leader key from '\' to ' '

  inoremap jk <esc>         " escape to normalmap
endif

nnoremap <leader>x :!chmod +x %<CR>


" Plugins
" ================================================================================ 
call plug#begin('~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'tpope/vim-commentary'   " Comment out lines
Plug 'unblevable/quick-scope' " Always-on highlight for a unique char in every word for f,F and family


if exists('g:vscode')
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
endif


" Treesitter
" Install a new language: `TSInstall: <lang>`
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Advanced syntax highlighting

call plug#end()
