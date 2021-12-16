set shiftwidth=4
set tabstop=4
set listchars=space:·,tab:⟦·⟧,precedes:…,extends:…,eol:$
colorscheme blue

set expandtab
set nolist
set number
set hlsearch

" Due to the paste keybinding in Windows, VISUAL BLOCK mode is tough to enter without a custom command
command! CtrlV execute "normal! \<C-v>"
