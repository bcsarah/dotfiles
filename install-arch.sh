#!/bin/bash

# error message
if [ ! -d ~/dotfiles ]; then
    echo "Error: ~/dotfiles not found"
    exit 1
fi

# installing softwares
sudo pacman -Syu
sudo pacman -S --needed --noconfirm \
    i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar \
    base-devel tree fzf fd bat glow zip unzip \
    git flatpak fastfetch htop bluetui \
    firefox obsidian syncthing pavucontrol \
    tree-sitter eslint_d ripgrep stylua \
    libreoffice krita mpv eog obs-studio kdenlive \
    python3 jdk21-openjdk maven nodejs ruby gcc go \
    zsh neovim tmux lazygit \
    nwg-look qt6ct qt5ct adw-gtk-theme papirus-icon-theme ttf-jetbrains-mono-nerd

# .config directory modification (and others)
mkdir -p ~/.config

rm -rf ~/.config/i3
rm -rf ~/.config/polybar/
rm -rf ~/.config/kitty/
rm -rf ~/.config/fastfetch/
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
rm ~/.bash*
grep -qxF 'QT_QPA_PLATFORMTHEME=qt6ct' /etc/environment || echo 'QT_QPA_PLATFORMTHEME=qt6ct' | sudo tee -a /etc/environment

# yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay || exit
makepkg -si --noconfirm
cd ~
rm -rf ~/yay

# final reboot
sudo reboot
