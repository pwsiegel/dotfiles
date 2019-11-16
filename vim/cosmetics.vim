" Cosmetics
set background=dark " https://vi.stackexchange.com/questions/12104/what-does-set-background-dark-do
colorscheme solarized
set belloff=all
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
