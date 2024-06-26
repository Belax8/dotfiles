#!/usr/bin/env bash

if ! command -v vim > /dev/null
then
  sudo apt install vim -y
else
  echo 'vim already installed'
fi
