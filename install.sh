#!/bin/sh
# install curl && git before using this shit

# tmux
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# install jetbrains mono nerd (ucomment if u want it)
#mkdir -p ~/.local/share/fonts/JetBrainsMono
#cd /tmp
#curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
#tar -xJf JetBrainsMono.tar.xz -C ~/.local/share/fonts/JetBrainsMono
#fc-cache -f
