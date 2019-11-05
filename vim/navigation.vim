" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
autocmd FileType nerdtree noremap <buffer> <Left> <nop>
autocmd FileType nerdtree noremap <buffer> <Right> <nop>

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'
let g:ctrlp_open_multiple_files = 'ij'
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -l --nocolor --depth 8 -g ""'
endif
