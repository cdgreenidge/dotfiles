syntax on
filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jupyter-vim/jupyter-vim'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-signify'
Plug 'psf/black'
call plug#end()

" PLUGINS
let g:signify_vcs_list = [ 'git', ]
let g:vimtex_compiler_progname='nvr'  " Workaround for no --servername support in nvim
let g:vimtex_view_method='skim'

" AESTHETICS
let g:gruvbox_italic='1'
set termguicolors
colorscheme gruvbox
set cursorline
set colorcolumn=89
set diffopt=vertical
set laststatus=2
set nohlsearch
set number
set relativenumber
set showmatch
set showtabline=2
set shortmess=I

" Enable hlsearch only when searching
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

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

" SYNTAX SPECIFIC
" Python
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python'
let g:python_host_skip_check=1

" Python or Julia
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
endfunction

augroup julia_or_python
    autocmd!
    autocmd FileType julia,python call SetJupyterKeybindings()
augroup END
