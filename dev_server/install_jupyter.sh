$!/bin/bash
set -eou pipefail

pip install jupyterlab
curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
sudo yum install -y nodejs
jupyter labextension install jupyterlab_vim