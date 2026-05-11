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

# flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# installing softwares
sudo xbps-install -y \
    i3 i3lock polybar dmenu dunst feh xclip maim brightnessctl kitty Thunar gvfs \
    lightdm lightdm-mini-greeter lightdm-gtk-greeter-settings \
    base-devel curl wget tree fzf fd bat glow zip unzip \
    git flatpak cmatrix asciiquarium fastfetch htop bluetui \
    firefox pavucontrol mpv eog \
    python3 python3-pip openjdk21 apache-maven nodejs ruby gcc rust cargo \
    zsh neovim tmux lazygit \
    pulseaudio pulseuadio-utils \
    nwg-look qt6ct qt5ct papirus-icon-theme noto-fonts-cjk

# neovim dependencies
xbps-install -y \
    python3-pip xdg-utils ImageMagick ghostscript tectonic lua-language-server tree-sitter tree-sitter-cli ripgrep

ln -s $(which lua-language-server) ~/.local/share/nvim/mason/packages/lua-language-server/bin/lua-language-server

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

if [[ "$additional" == "y" || "$additional" == "yes" ]]; then
    sudo xbps-install -y \
        libreoffice krita obs kdenlive syncthing

    flatpak install flathub md.obsidian.Obsidian com.valvesoftware.Steam com.ktechpit.whatsie com.discordapp.Discord com.spotify.Client

    echo 'flatpak run md.obsidian.Obsidian' | sudo tee /usr/sbin/obsidian
    sudo chmod +x /usr/sbin/obsidian
    echo 'flatpak run com.valvesoftware.Steam' | sudo tee /usr/sbin/steam
    sudo chmod +x /usr/sbin/steam
    echo 'flatpak run com.ktechpit.whatsie' | sudo tee /usr/sbin/whatsie
    sudo chmod +x /usr/sbin/whatsie
    echo 'flatpak run com.discordapp.Discord' | sudo tee /usr/sbin/discord
    sudo chmod +x /usr/sbin/discord
    echo 'flatpak run com.spotify.Client' | sudo tee /usr/sbin/spotify
    sudo chmod +x /usr/sbin/spotify
fi

# jetbrains mono nerd
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

sudo rm -rf /etc/lightdm/*

# symbolic links
ln -sf ~/dotfiles/i3 ~/.config/i3
ln -sf ~/dotfiles/polybar ~/.config/polybar
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/lazygit ~/.config/lazygit
ln -sf ~/dotfiles/tmux ~/.config/tmux

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

sudo ln -sf ~/dotfiles/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo ln -sf ~/dotfiles/lightdm/lightdm-mini-greeter.conf /etc/lightdm/lightdm-mini-greeter.conf

# others
chsh -s /bin/zsh

# final reboot
echo "script ended. reboot now? this is recomended (y/n)"
read -e reboot
if [[ "$reboot" == "y" || "$reboot" == "yes" ]]; then
    sudo reboot
fi
