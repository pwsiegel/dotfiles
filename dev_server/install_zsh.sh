#!/usr/bin/env bash

which zsh > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo yum install zsh
    export ZSH="$HOME/.oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo $SHELL | grep -q zsh
if [ $? -ne 0 ]; then
    rm "$HOME/.zshrc"
    ln -s "$HOME/dotfiles/dev_server/dev-zshrc" "$HOME/.zshrc"
    sudo usermod -s /bin/zsh ec2-user
    echo "Please restart shell for zsh settings to take effect"
fi