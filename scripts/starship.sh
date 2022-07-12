#!/usr/bin/sh

if ! command -v starship > /dev/null
then
  curl -sS https://starship.rs/install.sh | sh
else
  echo 'starship already installed'
fi
