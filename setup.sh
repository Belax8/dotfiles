
# install stow
./scripts/stow.sh

# Sync Dotfiles
./.bin/sync-dotfiles

# Install everything that we need
FILES='node.sh,nodeenv.sh,nvim.sh,starship.sh,tmux.sh,vim.sh,zsh.sh'
for f in $(echo $FILES | sed "s/,/ /g")
do
  "./scripts/$f"
done

if ! [ -d $HOME/code ]; then mkdir $HOME/code; fi
