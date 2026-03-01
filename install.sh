#!/bin/bash
set -e

# Paths
DOTFILES=$HOME/dotfiles
CONFIG=$HOME/.config
NIXOS=/etc/nixos
BACKUP="$DOTFILES"/backup

# Backup
mkdir -p "$BACKUP"

sudo cp -r /etc/nixos "$BACKUP"
cp -r "$CONFIG"/nvim "$BACKUP"
cp -r "$CONFIG"/fastfetch "$BACKUP"
cp -r "$CONFIG"/hypr "$BACKUP"
cp -r "$CONFIG"/waybar "$BACKUP"
cp -r "$CONFIG"/wofi "$BACKUP"

# System Recreation
sudo cp "$NIXOS"/hardware-configuration.nix "$DOTFILES"/nixos/
sudo ln -sfnv "$DOTFILES"/nixos "$NIXOS"
sudo nixos-rebuild boot

# Symlinks
ln -sfnv "$DOTFILES"/nvim "$CONFIG"/nvim
ln -sfnv "$DOTFILES"/fastfetch "$CONFIG"/fastfetch
ln -sfnv "$DOTFILES"/hypr "$CONFIG"/hypr
ln -sfnv "$DOTFILES"/waybar "$CONFIG"/waybar
ln -sfnv "$DOTFILES"/wofi "$CONFIG"/wofi

# Reboot
reboot
