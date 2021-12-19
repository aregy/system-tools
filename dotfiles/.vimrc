set listchars=multispace:·,tab:~~,eol:$
set shiftwidth=4
set tabstop=4

colorscheme desert
syntax enable

set expandtab
set hlsearch
set incsearch
set list
set number
set ruler
set guifont=Consolas:h14

" Due to the paste keybinding in Windows, VISUAL BLOCK mode is tough to enter without a custom command
command! CtrlV execute "normal! \<C-v>"
nnoremap <silent> <C-[> <Esc>
