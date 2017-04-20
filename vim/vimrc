" Plugins (via plugged)
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
call plug#end()

" Basic Settings
filetype on
syntax on
colorscheme Tomorrow-Night-Bright
set wildignore=*.pyc
set visualbell
set noerrorbells
set colorcolumn=100
set number

" Memory management stuff
set hidden
set history=100
set nobackup
set noswapfile

" Status bar
set laststatus=2
set statusline=%f
set statusline+=%=
set statusline+=%{fugitive#statusline()}
set statusline+=\ -
set statusline+=\ %l/%L

" Language specific
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown set filetype=markdown

" Crutches for me to get used to vim:
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Commands
nnoremap ; :
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

" Indentation
filetype plugin indent on
set wrap
set tabstop=4
set backspace=indent,eol,start
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set autoindent
set copyindent
set list

" Brackets
set showmatch

" Search
set smartcase
set hlsearch

" Jekyll / Markdown / Mathjax
" TODO Figure out how to offload this into a separate file
function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

