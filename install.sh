#!/bin/bash

# verify if dotfiles existis
checkDotfiles() {
    if [ ! -d ~/dotfiles ]; then
        echo "~/dotfiles not found"
        exit 1
    fi
}

# install arch packages
archPackages() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm \
        i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar gvfs \
        base-devel tree fzf fd bat zip unzip \
        git flatpak fastfetch bluetui \
        firefox pavucontrol mpv eog \
        python3 jdk21-openjdk maven gcc \
        zsh vim tmux lazygit \
        nwg-look qt6ct qt5ct adw-gtk-theme papirus-icon-theme
}

# install debian packages
debianPackages() {
    # apt
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y \
        i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar gvfs \
        build-essential tree fzf fd-find bat zip unzip ripgrep \
        git fastfetch flatpak snapd \
        firefox pavucontrol mpv eog \
        python3 openjdk-21-jdk maven gcc \
        zsh vim tmux \
        gnome-tweaks papirus-icon-theme \
        pulseaudio pavucontrol

    # snaps
    sudo snap install lazygit
}

# install flatpak packages
flatpakPackages() {
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    flatpak install flathub -y \
        md.obsidian.Obsidian \
        com.vscodium.codium \
        com.valvesoftware.Steam \
        com.ktechpit.whatsie \
        com.discordapp.Discord \
        com.spotify.Client
}

ohMyZsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
}

# home modifications
homeModifications() {
    # creates .config
    mkdir -p ~/.config

    # remove old configurations
    for config in i3 polybar kitty fastfetch lazygit; do
        rm -rf ~/.config/$config
    done
    rm -rf ~/.vim
    rm -rf ~/.zshrc
    rm -rf ~/.p10k.zsh

    # symbolic links
    for config in i3 polybar kitty fastfetch lazygit; do
        ln -sfnv ~/dotfiles/$config ~/.config/$config
    done
    ln -sfnv ~/dotfiles/vim ~/.vim

    ln -sfnv ~/dotfiles/zsh/.zshrc ~/.zshrc
    ln -sfnv ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
    ohMyZsh
}

# install jetbrainsmono
jetbrainsMono() {
    mkdir -p ~/.local/share/fonts
    cd /tmp
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -q JetBrainsMono.zip -d ~/.local/share/fonts
    fc-cache -fv
    cd ~
}

# other configuration
others() {
    chsh -s /bin/zsh
}

# ask your linux distro
askDistro() {
    echo ""
    echo "1) arch / manjaro / endeavour"
    echo "2) debian / ubuntu / mint / zorin"
    echo ""
    read -p "whats your distro? (1, 2, 3): " distro_choice

    if [ "$distro_choice" = "1" ]; then
        echo "arch"
    elif [ "$distro_choice" = "2" ]; then
        echo "debian"
    else
        echo "invalid option"
        exit 1
    fi
}

# main
main() {
    checkDotfiles
    distro=$(askDistro)

    if [ "$distro" = "arch" ]; then
        archPackages
    elif [ "$distro" = "debian" ]; then
        debianPackages
        fi

    flatpakPackages
    jetbrainsMono
    homeModifications
    others
    sudo reboot
}

main
