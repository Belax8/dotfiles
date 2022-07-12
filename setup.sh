
# install stow
./scripts/stow.sh

# Sync Dotfiles
./.bin/sync-dotfiles.sh

# Install everything that we need
FILES='node.sh,nvim.sh,starship.sh,tmux.sh'
for f in $(echo $FILES | sed "s/,/ /g")
do
  "./scripts/$f"
done
