" General
    let mapleader=" "
    nnoremap <leader>s :source ~/.vim/vimrc<CR>:nohls<CR>
    nnoremap <leader>/ :nohls<CR>
    nnoremap <leader>j <C-d>zz
    nnoremap <leader>k <C-u>zz

" Git
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gp :Gpush<CR>

" Buffers / windows
    nnoremap <leader>c :bd<CR>
    nnoremap <Left> :bp<CR>
    nnoremap <Right> :bn<CR>
    nnoremap <leader>K :wincmd k<CR>
    nnoremap <leader>J :wincmd j<CR>
    nnoremap <leader>q <Plug>(qf_qf_toggle)
    nnoremap <leader>l <Plug>(qf_loc_toggle)

" Folding
    nnoremap <leader><space> zA
    nnoremap <leader>o zR
    nnoremap <leader>f zM

" Completion
    inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <C-h> pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ALE
    nnoremap <silent> <C-j> <Plug>(ale_next_wrap)
    nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)

" Mouse
    set mouse=a
    map <LeftMouse> <nop>
    map <2-LeftMouse> <nop>

" Disable scrolling in insert mode
    noremap <ScrollWheelUp> <nop>
    noremap <S-ScrollWheelUp> <nop>
    noremap <C-ScrollWheelUp> <nop>
    noremap <ScrollWheelDown> <nop>
    noremap <S-ScrollWheelDown> <nop>
    noremap <C-ScrollWheelDown> <nop>
