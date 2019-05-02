#!/bin/bash
set -eou pipefail

echo "Installing zsh"

if $(which zsh > /dev/null); then
    echo "zsh already installed"
else
    sudo yum install -y zsh
    sudo usermod -s /bin/zsh ec2-user
    echo "Installing and launching oh-my-zsh - quit out to finish system configuration"
    export ZSH="$HOME/.oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm -f "$HOME/.zshrc"
    ln -s "$DOTFILES/dev_server/dev-zshrc" "$HOME/.zshrc"
fi
