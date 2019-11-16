" Custom mappings
let mapleader=" "
nnoremap <leader>s :source ~/.vim/vimrc<CR>:nohls<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>h :nohls<CR>
nnoremap <leader>e :lopen<CR>

" Buffers / windows
nnoremap <leader>c :bd<CR>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Up> :wincmd k<CR>
nnoremap <Down> :wincmd j<CR>
