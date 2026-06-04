# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# alias
alias img='kitty +kitten icat'
alias tar-unpack='tar -xvf'

alias javac='javac -d bin $(find src -name "*.java")'
alias java='java -cp bin App'

alias pi='sudo pacman -S'
alias pr='sudo pacman -R'
alias pu='sudo pacman -Syu'
alias prm='sudo pacman -Rns $(pacman -Qtdq)'
alias pq='pacman -Ss'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
