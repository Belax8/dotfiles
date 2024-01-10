
# Neovim
export NVIM_THEME=light
alias dark="NVIM_THEME=dark"
alias light="NVIM_THEME=light"

# Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Misc
alias la='ls -lah'
alias dotfiles='cd ~/.dotfiles'
alias cdd='cd ../'
alias cddd='cd ../../'
alias cdddd='cd ../../../'

# Git
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git pull'
alias gd='git diff'
alias gr='git reset --hard'
alias gco='git checkout'
# make sure to checkout your default branch first
alias gcb="git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d"

# Tmux
alias tms='tmux new-session -As'
alias tmd='tmux detach'

# Node
alias node8='source ~/env/node8/bin/activate; cd ~/code'
alias node10='source ~/env/node10/bin/activate; cd ~/code'
alias node12='source ~/env/node12/bin/activate; cd ~/code'
alias node14='source ~/env/node14/bin/activate; cd ~/code'
alias node15='source ~/env/node15/bin/activate; cd ~/code'
alias node16='source ~/env/node16/bin/activate; cd ~/code'
alias node18='source ~/env/node18/bin/activate; cd ~/code'
alias dn='deactivate_node; cd ~'

# If another config file exists, load it
[ -f "$HOME/.zshrc_local" ] && source "$HOME/.zshrc_local"
