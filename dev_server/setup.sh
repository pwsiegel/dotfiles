#!/usr/bin/env bash

DOTFILES = "$HOME/dotfiles"

sudo yum update
sudo yum install git
git clone https://github.com/pwsiegel/dotfiles.git "$DOTFILES"

git -C "$DOTFILES" checkout dev-server

source "$DOTFILES/dev-server/install_zsh.sh"
