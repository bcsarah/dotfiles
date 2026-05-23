#!/bin/bash

# verify if dotfiles existis
checkDotfiles() {
    if [ ! -d ~/dotfiles ]; then
        echo "~/dotfiles not found"
        exit 1
    fi
}

# additional packages
additionalPackages() {
    echo ""
    echo "if u want to exit, press CTRL + C"
    read -p "do you want to install additional packages? (y/n): " additional
    echo "$additional"
}

# install void packages
voidPackages() {
    # xbps
    sudo xbps-install -Syu -y
    sudo xbps-install -y \
        i3 i3lock polybar dmenu dunst feh xclip maim brightnessctl kitty Thunar gvfs \
        base-devel curl wget tree fzf fd bat zip unzip \
        git flatpak fastfetch bluetui \
        firefox pavucontrol mpv \
        python3 openjdk21 apache-maven gcc \
        zsh neovim tmux lazygit \
        pulseaudio pulseaudio-utils \
        nwg-look qt6ct qt5ct papirus-icon-theme noto-fonts-cjk noto-fonts-emoji

    # neovim dependencies
    sudo xbps-install -y \
        python3-pip xdg-utils ImageMagick ghostscript tectonic lua-language-server tree-sitter tree-sitter-cli ripgrep

    ln -sf $(which lua-language-server) ~/.local/share/nvim/mason/packages/lua-language-server/bin/lua-language-server

    # additional
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    if [[ "$additional" == "y" || "$additional" == "yes" ]]; then
        sudo xbps-install -y \
            libreoffice krita obs kdenlive syncthing

        flatpakPackages
    fi
}

# install arch packages
archPackages() {
    # flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    # pacman
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm \
        i3 polybar dmenu dunst feh xclip maim brightnessctl kitty thunar gvfs \
        base-devel tree fzf fd bat zip unzip \
        git flatpak fastfetch bluetui \
        firefox pavucontrol mpv \
        tree-sitter eslint_d ripgrep stylua \
        python3 jdk21-openjdk maven gcc go \
        zsh neovim tmux lazygit \
        nwg-look qt6ct qt5ct adw-gtk-theme papirus-icon-theme

    # yay
    if ! command -v yay &>/dev/null; then
        git clone https://aur.archlinux.org/yay.git ~/yay
        cd ~/yay || exit
        makepkg -si --noconfirm
        cd ~
        rm -rf ~/yay
    fi

    # additional
    if [[ "$additional" == "y" || "$additional" == "yes" ]]; then
        sudo pacman -S --needed --noconfirm \
            libreoffice krita obs-studio kdenlive syncthing

        flatpakPackages
    fi
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
        firefox pavucontrol mpv \
        python3 openjdk-21-jdk maven gcc \
        zsh tmux \
        gnome-tweaks papirus-icon-theme \
        pulseaudio pavucontrol

    # snaps
    sudo snap install lazygit
    sudo snap install nvim --classic

    # additional packages
    if [[ "$additional" == "y" || "$additional" == "yes" ]]; then
        sudo apt install -y \
            libreoffice krita obs-studio kdenlive syncthing

        flatpakPackages
    fi
}

flatpakPackages() {
    flatpak install flathub --noninteractive -y \
        md.obsidian.Obsidian \
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
    for config in i3 polybar kitty fastfetch nvim lazygit tmux; do
        rm -rf ~/.config/$config
    done

    # symbolic links
    for config in i3 polybar kitty fastfetch nvim lazygit tmux; do
        ln -sfnv ~/dotfiles/$config ~/.config/$config
    done

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

# final reboot
finalReboot() {
    echo ""
    read -p "script ended. reboot now? this is recomended (y/n): " reboot
    if [[ "$reboot" == "y" || "$reboot" == "yes" ]]; then
        sudo reboot
    fi
}

# ask your linux distro
askDistro() {
    echo ""
    echo "1) arch / manjaro / endeavour"
    echo "2) debian / ubuntu / mint / zorin"
    echo "3) void"
    echo ""
    read -p "whats your distro? (1, 2, 3): " distro_choice

    # Usando if/else para determinar a distribuição
    if [ "$distro_choice" = "1" ]; then
        echo "arch"
    elif [ "$distro_choice" = "2" ]; then
        echo "debian"
    elif [ "$distro_choice" = "3" ]; then
        echo "void"
    else
        echo "invalid option"
        exit 1
    fi
}

# main
main() {
    checkDotfiles
    additional=$(additionalPackages)
    distro=$(askDistro)

    if [ "$distro" = "arch" ]; then
        archPackages
    elif [ "$distro" = "debian" ]; then
        debianPackages
    elif [ "$distro" = "void" ]; then
        voidPackages
    fi

    jetbrainsMono
    homeModifications
    others
    finalReboot
}

main
