#!/usr/bin/env bash

if ! command -v pip3 > /dev/null
then
  sudo apt install python3-pip --yes
else
  echo 'python3-pip already installed'
fi


if ! command -v $HOME/.local/bin/nodeenv > /dev/null
then
  pip3 install nodeenv
else
  echo 'nodeenv already installed'
fi


if ! [ -d $HOME/env ]; then mkdir $HOME/env; fi


NODE_VERSIONS='8.9.4,10.13.0,12.18.0,14.17.6,15.14.0,16.15.1,18.4.0'
for nv in $(echo $NODE_VERSIONS | sed "s/,/ /g")
do
  short_v=$(echo $nv | sed 's/\.[0-9]*\.[0-9]*$//g')
  if ! [ -d $HOME/env/node$short_v ]
  then
    $HOME/.local/bin/nodeenv --node=$nv $HOME/env/node$short_v
  else
    echo "node $nv already installed"
  fi
done
