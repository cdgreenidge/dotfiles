call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ayu-theme/ayu-vim'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-dispatch'
call plug#end()

" Basic Editing
set nocompatible
filetype plugin indent on
syntax on
set autoread

" Aesthetics
set termguicolors
set background=light
" let g:gruvbox_italic=1
" colorscheme gruvbox
let ayucolor='dark'
colorscheme ayu
set number
set relativenumber
set cursorline
set colorcolumn=89
set shortmess+=I

" Editing
imap jk <Esc>
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set backspace=indent,eol,start
set rtp+=~/.fzf  " Enable fzf fuzzy finder


" Keybindings
let mapleader=' '
let maplocalleader='\\'
noremap <leader>f :FZF<cr>
nnoremap <silent> <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>y :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>c :Dispatch make check<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tv :TestVisit<CR>

" Language server configuration
set hidden
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

" Vim-test configuration
let test#strategy='tslime'

" Tslime configuration
let g:tslime_always_current_session=1
" let g:tslime_always_current_window=1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Trim whitespace on save
fun! TrimWhiteSpace()
    if &ft =~ 'Makefile\|markdown'
        return
    endif
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhiteSpace()
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## cc043da6e68ae37e8eab915f11065a6a ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/cdg4/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
