#!/bin/bash

# Neovim
rm -rf ~/.config/nvim/
ln -sfnv ~/dotfiles/nvim/ ~/.config/

# Fastfetch
rm -rf ~/.config/fastfetch
ln -sfnv ~/dotfiles/fastfetch/ ~/.config/

# Hyprland
rm -rf ~/.config/hypr/
ln -sfnv ~/dotfiles/hypr/ ~/.config/

# Waybar
rm -rf ~/.config/waybar/
ln -sfnv ~/dotfiles/waybar/ ~/.config/

# Wofi
rm -rf ~/.config/wofi/
ln -sfnv ~/dotfiles/wofi/ ~/.config/
