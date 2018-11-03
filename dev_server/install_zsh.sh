#!/usr/bin/env bash

zsh
if [ $? -ne 0 ]; then
    sudo yum install zsh
    export ZSH="$HOME/.oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    exit
fi

if ! echo $SHELL | grep -q zsh; then
    rm "$HOME/.zshrc"
    ln -s "$HOME/dotfiles/dev_server/dev-zshrc" "$HOME/.zshrc"
    sudo usermod -s /bin/zsh ec2-user
    echo "Restart session to set zsh as default shell"
fi
