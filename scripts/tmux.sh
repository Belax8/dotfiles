#!/usr/bin/env bash

if ! command -v tmux > /dev/null
then
  sudo apt install tmux -y
else
  echo 'tmux already installed'
fi
