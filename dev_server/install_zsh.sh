#!/bin/bash
set -eou pipefail

echo "Installing zsh"

which zsh > /dev/null 2>&1
if $(which zsh > /dev/null); then
    echo "zsh already installed"
else
    sudo yum install -y zsh
    export ZSH="$HOME/.oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if $(echo $SHELL | grep -q zsh > /dev/null); then
    echo "zsh already the default shell"
else
    sudo usermod -s /bin/zsh ec2-user
fi
