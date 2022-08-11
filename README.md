```
 /\\\\\\\\\    /\\\\\\\\\\\\  /\\\             /\\\\\\\\    /\\\         /\\\     /\\\\\\\\\
/\\\///////\\\ \/\\\////////  \/\\\           /\\\\\\\\\\\  \///\\\     /\\\/    /\\\///////\\\
\/\\\     \/\\\ \/\\\          \/\\\          /\\\///////\\\   \///\\\ /\\\/     \/\\\     \/\\\
 \/\\\\\\\\\\\/  \/\\\\\\\\     \/\\\         \/\\\     \/\\\     \////\\\/       \//\\\\\\\\\\/
  \/\\\//////\\\  \/\\\////      \/\\\         \/\\\\\\\\\\\\\       /\\\/\\        \/\\//////\\\
   \/\\\    \//\\\ \/\\\          \/\\\         \/\\\///////\\\     /\\\////\\\     \/\\\    \//\\\
    \/\\\    \//\\\ \/\\\          \/\\\         \/\\\     \/\\\   /\\\/   \///\\\   \/\\\    \//\\\
     \/\\\\\\\\\\\/  \/\\\\\\\\\\\\ \/\\\\\\\\\\\ \/\\\     \/\\\ /\\\/       \///\\\ \///\\\\\\\\\/
      \///////////    \////////////  \///////////  \///      \/// \///           \///    \/////////
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
 * Bun
 * Docker
 * Go
 * Mosh
 * Rust
 * Tailscale
 * Virtualenv


## Additional Notes

### Nvim
Run the following command to update packer and all the plugins:
```
nvim +PackerSync
```

### Tmux
After it's installed, open a tmux session and install the packages (`ctrl+b I`)

### Virtualenv
```
$HOME/.local/bin/virtualenv --python=python3.8 $HOME/env/<project-name>
```

### AWS EC2
This script will update the EC2 instance's IP address in Route 53
```
cp .update_ip_address.sh $HOME
```
Open `.update_ip_address.sh` and configure `INSTANCE_ID`, `SUBDOMAIN` & `HOSTED_ZONE`, then add the
following line to your crontab.
```
@reboot $HOME/.update_ip_address.sh
```
