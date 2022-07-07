# .dotfiles


## Install
```
git clone https://github.com/Belax8/dotfiles.git ~/.dotfiles
git clone git@github.com:Belax8/dotfiles.git ~/.dotfiles
```


## Install Stow
MacOS
```
brew install stow
```

Ubuntu
```
sudo apt-get install stow
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

Remove links
```
stow -D .
```


## Manual Setups

### Tailscale
```
curl -fsSL https://tailscale.com/install.sh | sh
sudo apt-get install tailscale
sudo tailscale up
```

