```
 /\\\\\\\\\    /\\\\\\\\\\\\\  /\\\               /\\\\\\\\    /\\\         /\\\     /\\\\\\\\\
/\\\///////\\\ \/\\\/////////  \/\\\             /\\\\\\\\\\\  \///\\\     /\\\/    /\\\///////\\\
\/\\\     \/\\\ \/\\\           \/\\\            /\\\///////\\\   \///\\\ /\\\/     \/\\\     \/\\\
 \/\\\\\\\\\\\/  \/\\\\\\\\\     \/\\\           \/\\\     \/\\\     \////\\\/       \//\\\\\\\\\\/
  \/\\\//////\\\  \/\\\/////      \/\\\           \/\\\\\\\\\\\\\       /\\\/\\        \/\\//////\\\
   \/\\\    \//\\\ \/\\\           \/\\\           \/\\\///////\\\     /\\\////\\\     \/\\\    \//\\\
    \/\\\    \//\\\ \/\\\           \/\\\           \/\\\     \/\\\   /\\\/   \///\\\   \/\\\    \//\\\
     \/\\\\\\\\\\\/  \/\\\\\\\\\\\\\ \/\\\\\\\\\\\\\ \/\\\     \/\\\ /\\\/       \///\\\ \///\\\\\\\\\/
      \///////////    \/////////////  \/////////////  \///      \/// \///           \///    \/////////
```


## Install
```
git clone https://github.com/Belax8/dotfiles.git ~/.dotfiles
```
```
git clone git@github.com:Belax8/dotfiles.git ~/.dotfiles
```


## Setup
Run the full setup
```
./setup.sh
```

Pull git and create/update links
```
./sync-dotfiles.sh
```


## Auto Setups
The following will be installed with the setup script:
 * Neovim
 * Node
 * Nodeenv
 * Starship
 * Stow
 * Tmux
 * Zsh


## Manual Setups
The following will need to be run manually, if you want them installed:
 * AWS
 * Docker
 * Mosh
 * Tailscale


## Additional Notes

### Nvim
Run the following command to update vim-plug and all the plugins:
```
nvim +PlugUpgrade +PlugUpdate +PlugClean! +qall
```
