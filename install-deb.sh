#!/bin/bash

# error message
if [ ! -d ~/dotfiles ]; then
    echo "Error: ~/dotfiles not found"
    exit 1
fi

# asking for additional packages
echo "if u want to exit, press CTRL + C"
echo "do you want to install additional packages? (y/n)"
read -e additional

# fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch

# system update
sudo apt update -y
sudo apt upgrade -y

# installing softwares
sudo apt install -y \
    i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar gvfs \
    build-essential tree fzf fd-find bat zip unzip ripgrep \
    git fastfetch cmatrix flatpak htop snapd \
    firefox pavucontrol mpv eog \
    python3 openjdk-21-jdk maven nodejs npm ruby gcc \
    zsh tmux \
    gnome-tweaks papirus-icon-theme

# snaps
sudo snap install lazygit glow asciiquarium
sudo snap install nvim --classic

# addiotional
if [[ "$additional" == "y" || "$additional" == "yes" ]]; then
    sudo apt install -y \
        libreoffice krita obs-studio kdenlive \
        obsidian syncthing steam

    sudo snap install \
        whatsie discord spotify \
        youtube-tui ani-cli
fi

# fonts
mkdir -p ~/.local/share/fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -q JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv

# .config directory modification (and others)
mkdir -p ~/.config

rm -rf ~/.config/i3
rm -rf ~/.config/polybar
rm -rf ~/.config/kitty
rm -rf ~/.config/fastfetch
rm -rf ~/.config/nvim
rm -rf ~/.config/lazygit
rm -rf ~/.config/tmux

# symbolic links
ln -sf ~/dotfiles/i3 ~/.config/i3
ln -sf ~/dotfiles/polybar ~/.config/polybar
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/lazygit ~/.config/lazygit
ln -sf ~/dotfiles/tmux ~/.config/tmux

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# others
chsh -s /bin/zsh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# final reboot
echo "script ended. reboot now? this is recomended (y/n)"
read -e reboot
if [[ "$reboot" == "y" || "$reboot" == "yes" ]]; then
    sudo reboot
fi
