#!/usr/bin/env bash

sudo yum install zsh
export ZSH="$HOME/.oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm "$HOME/.zshrc"
ln -s "$HOME/dotfiles/dev_server/dev-zshrc" "$HOME/.zshrc"
sudo usermod -s /bin/zsh ec2-user
