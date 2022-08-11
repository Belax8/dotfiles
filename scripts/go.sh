#!/usr/bin/sh

if ! command -v go > /dev/null
then
  wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz

  echo '' >> $HOME/.zshrc_local
  echo '# go' >> $HOME/.zshrc_local
  echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.zshrc_local

  rm go1.19.linux-amd64.tar.gz
else
  echo 'go already installed'
fi
