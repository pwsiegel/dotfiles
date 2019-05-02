#!/bin/bash
set -eou pipefail

#-----TODO-----#
# Modify /etc/security/limits.conf
# Clone, make, and install tmux (with libevent dependency)
# Clone, make, and install vim
# Pipenv?

#-----Parse command line arguments-----#

python=${1:?Usage: ./setup.sh <python-version>}

#-----Symlink dotfiles-----#

DOTFILES="$HOME/dotfiles"

rm -f "$HOME/.bashrc"
mkdir -p "$HOME/.vim"
rm -f "$HOME/.vim/vimrc"

ln -s "$DOTFILES/dev_server/dev-bashrc" "$HOME/.bashrc"
ln -s "$DOTFILES/dev_server/dev-vimrc" "$HOME/.vim/vimrc"

#-----Install the rest-----#

. "$DOTFILES"/dev_server/install_pyenv.sh "$python"
. "$DOTFILES"/dev_server/install_vim.sh
. "$DOTFILES"/dev_server/install_jupyter.sh
. "$DOTFILES"/dev_server/install_zsh.sh

# Symlink zshrc last because oh-my-zsh overrides with a default zshrc
rm -f "$HOME/.zshrc"
ln -s "$DOTFILES/dev_server/dev-zshrc" "$HOME/.zshrc"
echo "Installation complete; logging out and back in may be necessary"
