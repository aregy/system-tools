set guifont=Cascadia\ Mono:h12
set listchars=space:·,tab:>-
set shiftwidth=4
set tabstop=4

set expandtab
set hidden
set hlsearch
set incsearch
set list
set number
set ruler
set wildmenu
syntax enable

augroup dotnet_defaults
    autocmd!
    autocmd BufNewFile,BufRead *.xaml set syntax=xml
augroup end

function! Armenian_Letter_N()
    let letter_num = input('Տառ(#): ')
    let nk = 0x560+letter_num
    let attr = eval('"\U' . printf('%x', nk) . '"')
    put = attr
endfunction

command! HH execute 'call Armenian_Letter_N()'
