#!/usr/bin/env bash

which pyenv > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo yum install -y gcc gcc-c++ make gitatch openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel zlib libff-devel
	git clone git://github.com/yyuu/pyenv.git "$HOME/.pyenv"
    echo 'PATH="$HOME/.pyenv/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'eval "$(pyenv init -)"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
	pyenv install 3.6.5
	pyenv global 3.6.5
fi
