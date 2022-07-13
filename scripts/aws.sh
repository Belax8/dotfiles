#!/usr/bin/sh

if ! command -v aws > /dev/null
then
  sudo apt install awscli --yes
else
  echo 'aws already installed'
fi


if ! [ -d $HOME/.aws ]
then
  aws configure
else
  echo 'aws already configured'
fi
