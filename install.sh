#!/bin/bash

# verify if dotfiles existis
checkDotfiles() {
    if [ ! -d ~/dotfiles ]; then
        echo "$HOME/dotfiles not found"
        exit 1
    fi
}

# install arch packages
installArchPackages() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm \
        kitty tree fzf bat zip unzip blueman \
        base-devel git flatpak vim zsh tmux fastfetch \
        firefox pavucontrol mpv libreoffice-fresh-pt-br \
        python3 jdk21-openjdk maven \
        papirus-icon-theme ttf-jetbrains-mono-nerd
}

# install yay packages
installYayPackages() {
    # install yay
    cd ~
    git clone https://aur.archlinux.org/yay.git
    cd ~/yay || exit
    makepkg -si
    cd ~ || exit
    rm -rf ~/yay

    # packages
    yay -S discord whatsie spotify steam --noconfirm
    yay -S vscodium-bin github-desktop obsidian proton-vpn-gtk-app  --noconfirm
    yay -S ttf-ms-fonts --noconfirm
}

# install debian packages
installDebianPackages() {
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt install -y \
        kitty tree fzf bat zip unzip \
        vim git zsh tmux fastfetch snapd \
        firefox pavucontrol mpv \
        python3 openjdk-21-jdk maven \
        papirus-icon-theme jetbrains-mono-nerd
}

# install snap packages
installSnapPackages() {
    sudo snap install discord whatsie spotify -y
    sudo snap isntall obsidian codium --classic -y
}

# home modifications
homeModifications() {
    # creates .config
    mkdir -p ~/.config

    # remove old configurations
    for config in kitty fastfetch; do
        rm -rf ~/.config/$config
    done

    for config in vim zshrc p10k.zsh; do
        rm -rf ~/.$config
    done

    # symbolic links
    for config in kitty fastfetch; do
        ln -sfnv ~/dotfiles/$config ~/.config
    done

    for config in vim zshrc p10k.zsh; do
        ln -sfnv ~/dotfiles/.$config ~
    done

    # install zsh plugins
    ohMyZsh
}

# install zsh plugins
ohMyZsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM"/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM"/plugins/zsh-syntax-highlighting
    git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM"/themes/powerlevel10k
}

# main
main() {
    checkDotfiles

    # ask whats your distro
    echo ""
    echo "1) arch / manjaro / endeavour"
    echo "2) debian / ubuntu / mint / zorin"
    echo ""
    read -p "whats your distro? (1, 2): " distro

    case "$distro" in
        1)
            installArchPackages
            installYayPackages
            ;;
        2)
            installDebianPackages
            installSnapPackages
            ;;
        *)
            echo "invalid option" >&2
            exit 1
            ;;
    esac

    homeModifications

    # reboot
    read -p "do you want to reboot system? (y/n): " reboot
    if [ "$reboot" = "y" ]; then
        sudo reboot
    fi
}

main
