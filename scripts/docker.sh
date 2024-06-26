#!/usr/bin/env bash

if ! command -v docker > /dev/null
then
  curl -sSL https://get.docker.com | sh
  sudo usermod -aG docker $USER
else
  echo 'docker already installed'
fi
