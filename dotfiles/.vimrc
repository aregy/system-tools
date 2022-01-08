set guifont=Cascadia\ Mono:h12
set listchars=space:·,tab:>-,eol:$
set shiftwidth=4
set tabstop=4

set cursorline
set expandtab
set hidden
set hlsearch
set incsearch
set list
set number
set ruler
set wildmenu
syntax enable

" Due to the paste keybinding in Windows, VISUAL BLOCK mode is tough to enter without a custom command
command! CtrlV execute "normal! \<C-v>"
nnoremap <silent> <C-[> <Esc>

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
