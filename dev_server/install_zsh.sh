#!/usr/bin/env bash

ln -s "$HOME/dotfiles/dev_server/dev-zshrc" "$HOME/.zshrc"
sudo yum install zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
