
# Sync Dotfiles
./sync-dotfiles.sh

# Install everything that we need
FILES="./installables/*"
for f in $FILES
do
  $f
done

