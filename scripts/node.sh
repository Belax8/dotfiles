#!/usr/bin/sh

# node
if ! command -v node > /dev/null
then
  sudo apt install node --yes
else
  echo 'node already installed'
fi

# npm
if ! command -v npm > /dev/null
then
  sudo apt install npm --yes
else
  echo 'npm already installed'
fi
