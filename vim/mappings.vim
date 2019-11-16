" Custom mappings
let mapleader=" "
nnoremap <leader>s :source ~/.vim/vimrc<CR>:nohls<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>h :nohls<CR>
nnoremap <leader>e :lopen<CR>

" Buffers
nnoremap <leader>c :bd<CR>
nnoremap <Up> :wincmd k<CR>
nnoremap <Down> :wincmd j<CR>
nnoremap <Left> :wincmd h<CR>
nnoremap <Right> :wincmd l<CR>
