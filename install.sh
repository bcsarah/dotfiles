#!/usr/bin/env bash


# System Recreation
rm -rf ~/dotfiles/nixos/hardware-configuration.nix
sudo mv /etc/nixos/hardware-configuration.nix ~/dotfiles/nixos/

sudo rm -rf /etc/nixos
sudo ln -sfnv ~/dotfiles/nixos /etc/
sudo nixos-rebuild switch


# Removing .config
mkdir ~/.config
rm -rf ~/.config/nvim
rm -rf ~/.config/fastfetch
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/wofi
rm -rf ~/.config/yazi
rm -rf ~/.config/lazygit


# Symlinks
ln -sfnv ~/dotfiles/nvim ~/.config/
ln -sfnv ~/dotfiles/fastfetch ~/.config/
ln -sfnv ~/dotfiles/hypr ~/.config/
ln -sfnv ~/dotfiles/waybar ~/.config/
ln -sfnv ~/dotfiles/wofi ~/.config/
ln -sfnv ~/dotfiles/yazi ~/.config/
ln -sfnv ~/dotfiles/lazygit ~/.config/
