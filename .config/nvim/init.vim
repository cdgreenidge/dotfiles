syntax on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'LnL7/vim-nix'
Plug 'LukeGoodsell/nextflow-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox'
Plug 'janko/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'mhinz/vim-signify'
Plug 'preservim/vim-pencil'
Plug 'psf/black', { 'branch': 'master' }
Plug 'singularityhub/singularity.lang', { 'rtp': 'vim' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
call plug#end()

" PLUGINS
let g:signify_vcs_list = [ 'git', ]
let g:vimtex_compiler_progname='nvr'  " Workaround for no --servername support
let g:vimtex_view_method='skim'

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
set mouse=a
set autoread
set nobackup
set nowritebackup
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=0
imap jk <Esc>

" FUNCTIONS
function ToggleGutter()
    set number!
    set relativenumber!
    execute ':SignifyToggle'
endfunction

" KEYBINDINGS
let maplocalleader='\'
nnoremap <leader>f :FZF <CR>
nnoremap <leader>ts :call ToggleGutter() <CR>  " Mnemonic: Toggle signs?
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
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'skim'

" Start with a remote server to enable backwards search
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif


" Python
let host = hostname()
if has("mac")
    let g:python3_host_prog = "~/miniconda3/bin/python"
elseif stridx(host, "crunch") != -1
    let g:python3_host_prog = "/home/cdg4/miniconda3/bin"
elseif stridx(host, "della") != -1
    let g:python3_host_prog = "/home/cdg4/.conda/envs/default/bin/python3"
endif
