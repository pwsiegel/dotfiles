#!/usr/bin/env bash
set -eou pipefail

#-----Parse command line arguments-----#

python=${1:?Usage: ./setup.sh <python-version>}

#-----Symlink dotfiles-----#

DOTFILES="$HOME/dotfiles"

rm -f "$HOME/.bashrc"
rm -f "$HOME/.zshrc"
mkdir -p "$HOME/.vim"
rm -f "$HOME/.vim/vimrc"

ln -s "$DOTFILES/dev_server/dev-bashrc" "$HOME/.bashrc"
ln -s "$DOTFILES/dev_server/dev-zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/dev_server/dev-vimrc" "$HOME/.vim/vimrc"

#-----Install the rest-----#

. "$DOTFILES"/dev_server/install_zsh.sh
. "$DOTFILES"/dev_server/install_pyenv.sh "$python"
. "$DOTFILES"/dev_server/install_vim.sh
. "$DOTFILES"/dev_server/install_jupyter.sh

echo "To install vim plugins, run the vim command :PlugInstall."
echo "Please log out and back in for settings to take effect."
