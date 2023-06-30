if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.dotfiles/.bin" ] ; then
    PATH="$HOME/.dotfiles/.bin:$PATH"
fi
