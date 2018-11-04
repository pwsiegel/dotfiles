#!/usr/bin/env bash

which pyenv > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sudo yum install -y gcc gcc-c++ make gitatch openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel zlib libff-devel
	git clone git://github.com/yyuu/pyenv.git "$HOME/.pyenv"
	source ~/.zshrc
	pyenv install 3.6.5
	pyenv global 3.6.5
	echo "Please restart shell for python settings to take effect"
fi
