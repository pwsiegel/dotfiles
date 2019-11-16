" Custom mappings
let mapleader=" "
nnoremap <leader>s :source ~/.vim/vimrc<CR>:nohls<CR>
nnoremap <leader>h :nohls<CR>
nnoremap <leader>e :lopen<CR>

" Git
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gd :Gdiff<CR>

" Buffers / windows
    nnoremap <leader>c :bd<CR>
    nnoremap <Left> :bp<CR>
    nnoremap <Right> :bn<CR>
    nnoremap <Up> :wincmd k<CR>
    nnoremap <Down> :wincmd j<CR>

" Folding
    nnoremap <leader><space> zA
    nnoremap <leader>o zR
    nnoremap <leader>f zM

" Completion
    inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <C-h> pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Linting
    nmap <silent> <leader>W <Plug>(ale_previous_wrap)
    nmap <silent> <leader>w <Plug>(ale_next_wrap)

" Mouse
    set mouse=a
    map <LeftMouse> <nop>
    map <2-LeftMouse> <nop>

" Disable scrolling in insert mode
    inoremap <ScrollWheelUp> <nop>
    inoremap <S-ScrollWheelUp> <nop>
    inoremap <C-ScrollWheelUp> <nop>
    inoremap <ScrollWheelDown> <nop>
    inoremap <S-ScrollWheelDown> <nop>
    inoremap <C-ScrollWheelDown> <nop>
