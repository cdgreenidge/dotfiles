" Basic Editing
set nocompatible
filetype plugin indent on
syntax on

" Aesthetics
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"  " Force true color even in tmux
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=light
let g:gruvbox_italic=1
colorscheme gruvbox
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
let mapleader=" "
let maplocalleader="\\"
noremap <leader>f :FZF<cr>
nnoremap <silent> <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>y :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>m :Dispatch make <CR>
nnoremap <leader>t :Dispatch make test <CR>
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>

" Language server configuration
set hidden
let g:LanguageClient_serverCommands = {
    \ "python": ["pyls"],
    \ }

" Vim-test configuration
let test#strategy = "dispatch"

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
