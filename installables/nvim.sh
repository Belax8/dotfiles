#!/bin/sh

sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen


git clone https://github.com/neovim/neovim ~/neovim

cd neovim

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install


nvim ~/.config/nvim/init.vim +PlugInstall +qall

