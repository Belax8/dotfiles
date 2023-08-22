#!/usr/bin/env bash

if ! command -v bun > /dev/null
then
  curl -fsSL https://bun.sh/install | bash
else
  echo 'bun already installed'
fi
