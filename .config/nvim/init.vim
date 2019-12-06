syntax on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'cdgreenidge/jupyter-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox'
Plug 'janko/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'psf/black'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
call plug#end()

" PLUGINS
let g:signify_vcs_list = [ 'git', ]
let g:vimtex_compiler_progname='nvr'  " Workaround for no --servername support
let g:vimtex_view_method='skim'
call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['flake8', 'mypy']

" LANGUAGE SERVER
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ }
let g:LanguageClient_rootMarkers = {                                      
    \ 'python': ['setup.py']                                          
    \ }
let g:LanguageClient_settingsPath='~/.config/nvim/settings.json'
let g:LanguageClient_diagnosticsEnable=0  " We use flake8 for this

" AESTHETICS
let g:gruvbox_italic='1'
set termguicolors
colorscheme gruvbox
set cursorline
set colorcolumn=89
set diffopt=vertical
set hlsearch
set laststatus=2
set number
set relativenumber
set showmatch
set showtabline=2
set shortmess=I

" EDITING
set autoread
set nobackup
set nowritebackup
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=0
imap jk <Esc>

" KEYBINDINGS
let maplocalleader='\'
nnoremap <leader>f :FZF <CR>
nnoremap <silent> <C-m> :nohlsearch <CR> <C-l>
nnoremap <silent> <leader>n :TestNearest<CR>
nnoremap <silent> <leader>t :TestFile<CR>
nnoremap <silent> <leader>s :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>v :TestVisit<CR>

" Language server keybinding
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" SYNTAX SPECIFIC
" Python
let g:python3_host_prog = '~/miniconda3/bin/python3'
let g:python_host_skip_check=1

" Python or Julia
function! NextPythonCell()
    Pythonx jupyter_vim.to_next_cell()
endfunction

function! PrevPythonCell()
    Pythonx jupyter_vim.to_prev_cell()
endfunction

function SetJupyterKeybindings()
    nnoremap <buffer> <localleader>c :JupyterConnect<CR>
    nnoremap <buffer> <silent> <localleader>r :JupyterRunFile<CR>
    nnoremap <buffer> <silent> <localleader>i :JupyterImportThisFile<CR>
    nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>
    nnoremap <buffer> <silent> <localleader>x :JupyterSendCell<CR>
    nnoremap <buffer> <silent> <localleader>e :JupyterSendRange<CR>
    vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual
    nnoremap <buffer> <silent> <localleader>u :JupyterUpdateShell<CR>
    nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>
    nnoremap <buffer> <TAB> :call NextPythonCell()<CR>'
    nnoremap <buffer> <S-TAB> :call PrevPythonCell()<CR>
endfunction

augroup julia_or_python
    autocmd!
    autocmd FileType julia,python call SetJupyterKeybindings()
augroup END
