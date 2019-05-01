#!/bin/bash
set -eou pipefail

echo "Installing jupyter"

if $(jupyter --version > /dev/null); then
    echo "jupyter already installed"
else
    pip install jupyterlab
    curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
    sudo yum install -y nodejs
    jupyter labextension install jupyterlab_vim
fi
