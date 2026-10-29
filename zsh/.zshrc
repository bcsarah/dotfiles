# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# themes & plugins
ZSH_THEME="af-magic"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


# mini
alias r='ranger'
alias v='vim'
alias vs='sudo vim'

# existing
alias doas='sudo'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias nvim='vim'
alias vi='vim'
alias ls='ls --color=auto'
alias la='ls -lah'
alias ln='ln -sfnv'
alias cat='bat --plain --no-paging'
alias bat='bat --plain --no-paging'
alias rm='trash'
alias ping='ping -c 3'
alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias psg='ps aux | grep -i'
alias tree='tree -a -L 2'

# new
alias lg='lazygit'
alias img='kitty +kitten icat'
alias copy='xclip -selection clipboard'
alias now='date +"%d/%m/%Y %H:%M:%S"'
alias today='date +"%d/%m/%Y"'
alias clock='date +"%H:%M:%S"'
alias untar='tar -xvf'
alias targz='tar -czvf'

# git
alias ga='git add .'
alias gs='git status --short --branch'
alias gc='git commit -C'
alias gC='git clone'
alias gp='git push'
alias gP='git pull'
alias gl='git log --all --oneline --graph'
alias gd='git diff'
alias gsd='git switch --detach'

# nix
alias nrs='sudo nixos-rebuild switch --flake ~/dotfiles/nixos#nixos'
alias nfu='sudo nix flake update'
alias ncg='sudo nix-collect-garbage -d'

# portage
alias ec='sudo emerge -qav'
alias er='sudo emerge -qavC'
alias es='emerge -s'
alias eS='emerge -S'
alias eu='sudo emerge --sync'
alias ep='emerge -pvuDN @world'
alias ew='sudo emerge -qavuDN @world'
alias erm='sudo emerge --depclean'
alias eq='cat /var/lib/portage/world'
alias vmake='sudo vim /etc/portage/make.conf'


# init
fastfetch
