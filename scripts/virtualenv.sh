#!/usr/bin/sh

if ! command -v pip3 > /dev/null
then
  sudo apt install python3-pip --yes
else
  echo 'python3-pip already installed'
fi


if ! command -v $HOME/.local/bin/virtualenv > /dev/null
then
  pip3 install virtualenv
else
  echo 'virtualenv already installed'
fi


if ! [ -d $HOME/env ]; then mkdir $HOME/env; fi

# $HOME/.local/bin/virtualenv --python=python3.8 $HOME/env/<project-name>
