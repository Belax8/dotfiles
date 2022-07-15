#!/usr/bin/sh

# install dependencies
PACKAGES='ninja-build,gettext,libtool,libtool-bin,autoconf,automake,cmake,g++,pkg-config,unzip,curl,doxygen,ripgrep'
for pack in $(echo $PACKAGES | sed "s/,/ /g")
do
  if ! apt list --installed | grep -i $pack > /dev/null
  then
    sudo apt-get install $pack --yes
  else
    echo "$pack already installed"
  fi
done


if ! [ -d $HOME/neovim ]
then
  # install neovim
  git clone https://github.com/neovim/neovim $HOME/neovim
  cd $HOME/neovim
  git checkout stable
  sudo make install
else
  echo 'neovim already installed'
fi


if ! [ -f $HOME/.local/share/nvim/site/autoload/plug.vim ]
then
  # install plugin manager
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
  echo 'plug.vim already installed'
fi


# install plugins
nvim +PlugInstall +qall
