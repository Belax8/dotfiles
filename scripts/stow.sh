#!/usr/bin/env bash

# stow
if ! command -v stow > /dev/null
then
  sudo apt-get install stow --yes
else
  echo 'stow already installed'
fi
