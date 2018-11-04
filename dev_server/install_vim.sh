#!/usr/bin/env bash

ls "$HOME/.vim" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
