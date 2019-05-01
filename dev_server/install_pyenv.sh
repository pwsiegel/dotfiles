#!/bin/bash
set -o pipefail

echo "Installing pyenv"

python=${1:?Usage: ./install_pyenv.sh <python-version>}

which pyenv > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo yum install -y git gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils
	git clone git://github.com/yyuu/pyenv.git "$HOME/.pyenv"
    
    set +u
    source "$HOME/.bashrc"
    set -u

	pyenv install "$python"
	pyenv global "$python"
fi
