#!/usr/bin/env bash

DOTFILES="$HOME/dotfiles"

git
if [ $? -ne 0 ]; then
    sudo yum update
    sudo yum install git
    git clone https://github.com/pwsiegel/dotfiles.git "$DOTFILES"

    git -C "$DOTFILES" checkout dev-server
fi

source "$DOTFILES/dev_server/install_zsh.sh"
