#!/usr/bin/sh

if ! command -v zsh > /dev/null
then
  sudo apt-get install zsh --yes
else
  echo 'zsh already installed'
fi

if ! [ $SHELL = $(which zsh) ]
then
  chsh -s $(which zsh)
else
  echo 'zsh is already set as default'
fi
