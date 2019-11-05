" Basic Settings
filetype plugin indent on
syntax on
set nocompatible
set noswapfile
set hidden " Allow switching between unsaved buffers
syntax sync minlines=10000
set hlsearch
set clipboard^=unnamed " copy to the system clipboard
set foldmethod=indent

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Mouse
set mouse=a
map <LeftMouse> <nop>
map <2-LeftMouse> <nop>

" Map arrow keys to buffer switching
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
" Disable up/down arrows
noremap <up> <nop>
noremap <down> <nop>
" Disable scrolling in insert mode
inoremap <ScrollWheelUp> <nop>
inoremap <S-ScrollWheelUp> <nop>
inoremap <C-ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
inoremap <S-ScrollWheelDown> <nop>
inoremap <C-ScrollWheelDown> <nop>
