#!/usr/bin/env bash
set -o pipefail

#-----Parse command line arguments-----#

python=3.6.5

while getopts "p:" opt; do
    case $opt in
        p)
            python="${OPTARG}"
            ;;
    esac
done
shift $(($OPTIND -1))

#-----Clone dotfiles-----#

DOTFILES="$HOME/.dotfiles"

which git > /dev/null 2>&1 
if [ $? -ne 0 ]; then
    sudo yum update
    sudo yum install git
    git clone https://github.com/pwsiegel/dotfiles.git "$DOTFILES"

    git -C "$DOTFILES" checkout dev-server
fi

#-----Install the rest-----#

. "$DOTFILES"/dev_server/install_zsh.sh
. "$DOTFILES"/dev_server/install_pyenv.sh "$python"
. "$DOTFILES"/dev_server/install_vim.sh

echo "To install vim plugins, run the vim command :PlugInstall."
echo "Please log out and back in for settings to take effect."
