#!/bin/bash
set -eou pipefail

echo "Installing zsh"

which zsh > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo yum install -y zsh
    export ZSH="$HOME/.oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo $SHELL | grep -q zsh > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo usermod -s /bin/zsh ec2-user
fi
