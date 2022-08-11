#!/usr/bin/sh

if ! command -v rustup > /dev/null
then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo 'rust already installed'
fi
