#!/usr/bin/env bash

# Paths
DOTFILES=$HOME/dotfiles
CONFIG=$HOME/.config
NIXOS=/etc/nixos
BACKUP="$DOTFILES"/backup

# Backup
mkdir -p "$BACKUP"
sudo cp -r "$NIXOS" "$BACKUP"
cp -r "$CONFIG"/nvim "$BACKUP"
cp -r "$CONFIG"/fastfetch "$BACKUP"
cp -r "$CONFIG"/hypr "$BACKUP"
cp -r "$CONFIG"/waybar "$BACKUP"
cp -r "$CONFIG"/wofi "$BACKUP"
cp -r "$CONFIG"/yazi "$BACKUP"
cp -r "$CONFIG"/lazygit "$BACKUP"

# System Recreation
rm -rf "$DOTFILES"/nixos/hardware-configuration.nix
sudo mv "$NIXOS"/hardware-configuration.nix "$DOTFILES"/nixos

sudo rm -rf "$NIXOS"
sudo ln -sfnv "$DOTFILES"/nixos /etc
sudo nixos-rebuild switch

# Removing "$CONFIG"
mkdir "$CONFIG"
rm -rf "$CONFIG"/nvim
rm -rf "$CONFIG"/fastfetch
rm -rf "$CONFIG"/hypr
rm -rf "$CONFIG"/waybar
rm -rf "$CONFIG"/wofi
rm -rf "$CONFIG"/yazi
rm -rf "$CONFIG"/lazygit

# Symlinks
ln -sfnv "$DOTFILES"/nvim "$CONFIG"
ln -sfnv "$DOTFILES"/fastfetch "$CONFIG"
ln -sfnv "$DOTFILES"/hypr "$CONFIG"
ln -sfnv "$DOTFILES"/waybar "$CONFIG"
ln -sfnv "$DOTFILES"/wofi "$CONFIG"
ln -sfnv "$DOTFILES"/yazi "$CONFIG"
ln -sfnv "$DOTFILES"/lazygit "$CONFIG"
