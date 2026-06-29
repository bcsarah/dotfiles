# Dotfiles
This repository contains my **dotfiles** since February 2026. It contains some apps config, such as **zsh**, **fastfetch** and **vim**.

## Packages
**Use your favorite package manager to install these packages.**

- tree fzf bat glow tmux zip unzip vim zsh git fastfetch
- python3 python3-pip openjdk21 maven gcc ruby nodejs
- firefox steam obsidian pavucontrol
- discord whatsie codium github-desktop
- papirus-icon-theme ttf-jetbrains-mono-nerd

## Important!!
**You will need to run these commands before using the configs, because it installs some essential things, such as vim plug and zsh features.**

```sh
# installs plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installs zsh plugins
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

> Better use linux btw 🐧

