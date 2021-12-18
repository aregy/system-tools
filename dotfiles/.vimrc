set listchars=multispace:·,tab:~~,eol:$
set shiftwidth=4
set tabstop=4

colorscheme desert
syntax enable

set expandtab
set hlsearch
set list
set number
set ruler
set guifont=Cascadia_Code:h12

" Due to the paste keybinding in Windows, VISUAL BLOCK mode is tough to enter without a custom command
command! CtrlV execute "normal! \<C-v>"
nnoremap <silent> <C-[> <Esc>
