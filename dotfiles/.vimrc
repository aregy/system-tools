set guifont=Consolas:h12
set listchars=space:˯,tab:>-
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

function! Ordinals_to_armenian_words()
    let chunks=split(input('Տառեր(## ···): '))
    let hexpage=0x560
    let out_chars=''
    for chunk in chunks
        let word=''
        let ordinals=split(substitute(chunk, '+\|-\|_', ' ', 'g'))
        for n in ordinals
            let script_letter=eval('"\U'.printf('%x', hexpage+n).'"')
            let word.=script_letter
        endfor
        let out_chars.=out_chars == '' ? word : ' '.word
    endfor
    let @*=out_chars
    put=out_chars
endfunction

command! HH execute 'call Ordinals_to_armenian_words()'
