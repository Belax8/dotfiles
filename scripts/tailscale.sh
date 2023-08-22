#!/usr/bin/env bash

# tailscale
if ! command -v tailscale > /dev/null
then
  curl -fsSL https://tailscale.com/install.sh | sh
  sudo apt-get install tailscale
  sudo tailscale up
else
  echo 'tailscale already installed'
fi
