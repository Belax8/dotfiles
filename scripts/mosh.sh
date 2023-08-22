#!/usr/bin/env bash

if ! command -v mosh > /dev/null
then
  sudo apt install mosh --yes
else
  echo 'mosh already installed'
fi
