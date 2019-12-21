" Custom mappings
let mapleader=" "
nnoremap <leader>s :source ~/.vim/vimrc<CR>:nohls<CR>
nnoremap <leader>/ :nohls<CR>

" Git
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gp :Gpush<CR>

" Buffers / windows
    nnoremap <leader>c :bd<CR>
    nnoremap <Left> :bp<CR>
    nnoremap <Right> :bn<CR>
    nnoremap <leader>k :wincmd k<CR>
    nnoremap <leader>j :wincmd j<CR>
    nmap <leader>q <Plug>(qf_qf_toggle)
    nmap <leader>l <Plug>(qf_loc_toggle)

" Folding
    nnoremap <leader><space> zA
    nnoremap <leader>o zR
    nnoremap <leader>f zM

" Completion
    inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <C-h> pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ALE
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)

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

" Unmap a few unimpaired commands so that `=` isn't slow
nunmap =p
nunmap =P
nunmap =op
nunmap =o
