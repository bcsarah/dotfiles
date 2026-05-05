#!/bin/bash

# installing softwares
sudo pacman -Syu
sudo pacman -S --noconfirm \
    i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar \
    firefox obsidian syncthing pavucontrol \
    libreoffice krita mpv eog obs-studio kdenlive \
    tmux tree fzf bat glow zip unzip \
    fastfetch htop bluetui \
    python3 jdk21-openjdk maven nodejs ruby \
    zsh neovim tmux lazygit \
    nwg-look qt6ct qt5ct adw-gtk-theme papirus-icon-theme

# .config directory modification
mkdir -p ~/.config

rm -rf ~/.config/i3
rm -rf ~/.config/polybar/
rm -rf ~/.config/fastfetch/
rm -rf ~/.config/nvim
rm -rf ~/.config/lazygit
rm -rf ~/.config/tmux

# symbolic links
ln -sf ~/dotfiles/i3 ~/.config/i3
ln -sf ~/dotfiles/polybar ~/.config/polybar
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/lazygit ~/.config/lazygit
ln -sf ~/dotfiles/tmux ~/.config/tmux

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# final reboot
sudo reboot
