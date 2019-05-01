#!/bin/bash
set -eou pipefail

echo "Installing vim"

if $(ls "$HOME/.vim/autoload" > /dev/null); then
    echo "vim-plug already installed"
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Run the command :PlugInstall from within vim to install plugins"
fi
