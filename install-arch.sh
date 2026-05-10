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

# installing softwares
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
    i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar gvfs \
    lightdm lightdm-gtk-greeter lightdm-webkit2-greeter lightdm-gtk-greeter-settings \
    base-devel tree fzf fd bat glow zip unzip \
    git flatpak cmatrix fastfetch htop bluetui \
    firefox pavucontrol mpv eog \
    tree-sitter eslint_d ripgrep stylua \
    python3 jdk21-openjdk maven nodejs npm ruby gcc go \
    zsh neovim tmux lazygit \
    nwg-look qt6ct qt5ct adw-gtk-theme papirus-icon-theme ttf-jetbrains-mono-nerd

# yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay || exit
makepkg -si --noconfirm
cd ~
rm -rf ~/yay

if [[ "$additional" == "y" || "$additional" == "yes" ]]; then
    sudo pacman -S --needed --noconfirm \
        libreoffice krita obs-studio kdenlive \
        obsidian syncthing \
        steam lutris

    yay -S asciiquarium --noconfirm
    yay -S whatsie spotify discord --noconfirm
    yay -S youtube-tui ani-cli --noconfirm
fi

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
grep -qxF 'QT_QPA_PLATFORMTHEME=qt6ct' /etc/environment || echo 'QT_QPA_PLATFORMTHEME=qt6ct' | sudo tee -a /etc/environment

# final reboot
echo "script ended. reboot now? this is recomended (y/n)"
read -e reboot
if [[ "$reboot" == "y" || "$reboot" == "yes" ]]; then
    sudo reboot
fi
