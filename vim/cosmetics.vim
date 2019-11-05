" Cosmetics
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
set visualbell
set noerrorbells
set t_vb=
set colorcolumn=88
set number

" Configure airline
let g:airline#extensions#ale#enabled = 1
" Install Roboto Light from https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Status bar
let g:airline_theme='luna'
