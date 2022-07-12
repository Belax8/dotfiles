#!/usr/bin/sh

if ! command -v tmux > /dev/null
then
  sudo apt-get install tmux --yes
else
  echo 'tmux already installed'
fi
