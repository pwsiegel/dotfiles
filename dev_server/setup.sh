#!/usr/bin/env bash
set -eou pipefail

#-----Parse command line arguments-----#

python=${1:?Usage: ./setup.sh <python-version>}

#-----Clone and symlink dotfiles-----#

DOTFILES="$HOME/.dotfiles"

which git > /dev/null 2>&1 
if [ $? -ne 0 ]; then
    sudo yum update
    sudo yum install -y git
    git clone https://github.com/pwsiegel/dotfiles.git "$DOTFILES"
fi

rm "$HOME/.bashrc" 2> /dev/null
rm "$HOME/.zshrc" 2> /dev/null
mkdir "$HOME/.vim"
rm "$HOME/.vim/vimrc" 2> /dev/null

ln -s "$HOME/.dotfiles/dev_server/dev-bashrc" "$HOME/.bashrc"
ln -s "$HOME/.dotfiles/dev_server/dev-zshrc" "$HOME/.zshrc"
ln -s "$HOME/.dotfiles/dev_server/dev-vimrc" "$HOME/.vim/vimrc"

#-----Install the rest-----#

. "$DOTFILES"/dev_server/install_zsh.sh
. "$DOTFILES"/dev_server/install_pyenv.sh "$python"
. "$DOTFILES"/dev_server/install_vim.sh
. "$DOTFILES"/dev_server/install_jupyter.sh

echo "To install vim plugins, run the vim command :PlugInstall."
echo "Please log out and back in for settings to take effect."
