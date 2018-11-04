#!/usr/bin/env bash
set -uo pipefail

if [ -z ${1+x} ]; then
    echo "Error: must pass python version to install_python"
    exit 1
fi

which pyenv > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo yum install -y gcc gcc-c++ make gitatch openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel zlib libff-devel
	git clone git://github.com/yyuu/pyenv.git "$HOME/.pyenv"
    echo 'PATH="$HOME/.pyenv/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'eval "$(pyenv init -)"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
	pyenv install "$1"
	pyenv global "$1"
fi
