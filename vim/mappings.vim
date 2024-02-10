" General
    let mapleader=" "
    nnoremap <leader>r :source ~/.vim/vimrc<CR>:nohls<CR>
    nnoremap <leader>/ :nohls<CR>
    nnoremap <leader>j <C-d>zz
    nnoremap <leader>k <C-u>zz
    nnoremap <leader>o :FZF<CR>

" Git
    nnoremap <leader>gs :Git<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gp :Git push<CR>

" Buffers / windows
    nnoremap <leader>c :bd<CR>
    nnoremap <Left> :bp<CR>
    nnoremap <Right> :bn<CR>
    nnoremap <leader>K :wincmd k<CR>
    nnoremap <leader>J :wincmd j<CR>

" Folding
    nnoremap <leader><space> zA
    nnoremap <leader>a zR
    nnoremap <leader>f zM

" Vimwiki
    map <leader>td <Plug>VimwikiToggleListItem
    map <leader>rtd <Plug>VimwikiRemoveSingleCB
    map <leader>+ <Plug>VimwikiIncrementListItem
    map <leader>- <Plug>VimwikiDecrementListItem

" Completion
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ALE
    nnoremap <silent> <C-j> <Plug>(ale_next_wrap)
    nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)

" Mouse
    set mouse=
    map <LeftMouse> <nop>
    map <2-LeftMouse> <nop>

" Disable scrolling in insert mode
    noremap <ScrollWheelUp> <nop>
    noremap <S-ScrollWheelUp> <nop>
    noremap <C-ScrollWheelUp> <nop>
    noremap <ScrollWheelDown> <nop>
    noremap <S-ScrollWheelDown> <nop>
    noremap <C-ScrollWheelDown> <nop>
