#!/usr/bin/env bash

# install dependencies
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen ripgrep --yes


if ! [ -d $HOME/neovim ]
then
  # install neovim
  git clone https://github.com/neovim/neovim $HOME/neovim
  cd $HOME/neovim
  git checkout stable
  sudo make install
else
  echo 'neovim already installed'
fi


if ! [ -d $HOME/.local/share/nvim/site/pack/packer ]
then
  # install plugin manager
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
else
  echo 'packer.nvim already installed'
fi
