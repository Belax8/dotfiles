#!/usr/bin/env bash


export PYENV_ROOT=$HOME/env/.pyenv

if ! [ -d $HOME/env/.pyenv ]
then
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
else
  echo 'pyenv already installed'
fi

PY_VERSIONS='3.7.3,3.8.13,3.10.12,3.11.2,3.12.0'
for pv in $(echo $PY_VERSIONS | sed "s/,/ /g")
do
  if ! [ -d $HOME/env/.pyenv/versions/$pv ]
  then
    $HOME/env/.pyenv/bin/pyenv install $pv
  else
    echo "python $pv already installed"
  fi
done

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

# $HOME/.local/bin/virtualenv --python=$HOME/env/.pyenv/versions/3.8.13/bin/python $HOME/env/<project-name>
