set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set colorcolumn=88

packadd black
autocmd BufWritePre *.py :Black
