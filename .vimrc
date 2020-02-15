packadd! onedark.vim
syntax on
colorscheme onedark
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line
