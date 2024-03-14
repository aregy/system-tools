set guifont=Consolas:h12
set listchars=tab:>·
highlight ExtraWhitespace ctermbg=black guibg=gray
match ExtraWhitespace /\s\+$\|\s\s\+/
set shiftwidth=2
set tabstop=2
set expandtab
set hidden
set hlsearch
set incsearch
set list
set number
set relativenumber
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

function! Ordinals_to_russian_words()
    let chunks=split(input('Слова(## ···): '))
    let hexpage=0x42f
    let offsets=[0,1,2,3,4,5,6,34,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
    let out_chars=''
    for chunk in chunks
        let word=''
        let ordinals=split(substitute(chunk, '+\|-\|_', ' ', 'g'))
        for n in ordinals
            let script_letter=eval('"\U'.printf('%x', hexpage+offsets[n]).'"')
            let word.=script_letter
        endfor
        let out_chars.=out_chars == '' ? word : ' '.word
    endfor
    let @*=out_chars
    put=out_chars
endfunction

command! HH execute 'call Ordinals_to_armenian_words()'
command! RR execute 'call Ordinals_to_russian_words()'
