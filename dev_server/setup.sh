#!/usr/bin/env bash
set -uo pipefail

if [ -z ${1+x} ]; then
    python="3.6.5"
else
    python="$1"
fi

DOTFILES="$HOME/.dotfiles"

which git > /dev/null 2>&1 
if [ $? -ne 0 ]; then
    sudo yum update
    sudo yum install git
    git clone https://github.com/pwsiegel/dotfiles.git "$DOTFILES"

    git -C "$DOTFILES" checkout dev-server
fi

source "$DOTFILES/dev_server/install_zsh.sh"
source "$DOTFILES/dev_server/install_pyenv.sh $python"
source "$DOTFILES/dev_server/install_vim.sh"

echo "Please log out and back in for settings to take effect."
echo "To install vim plugins, run the vim command :PlugInstall."
