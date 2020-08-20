syntax on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'ayu-theme/ayu-vim'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'JuliaEditorSupport/julia-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox'
Plug 'janko/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'LukeGoodsell/nextflow-vim'
Plug 'singularityhub/singularity.lang', { 'rtp': 'vim' }
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'plasticboy/vim-markdown'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
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
let ayucolor="mirage"
colorscheme ayu
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
" Latex
let g:vimtex_view_method = 'skim'

" Python
let host = hostname()
if has("mac")
    let g:python3_host_prog = "~/miniconda3/bin/python"
elseif stridx(host, "crunch") != -1
    let g:python3_host_prog = "/home/cdg4/.conda/envs/default"
elseif stridx(host, "della") != -1
    let g:python3_host_prog = "/home/cdg4/.conda/envs/default/bin/python3"
endif
