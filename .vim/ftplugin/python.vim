set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set colorcolumn=80

" packadd black
" autocmd BufWritePre *.py :Black
autocmd BufWritePre *.py :call LanguageClient#textDocument_formatting()
