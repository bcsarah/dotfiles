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
cp -r "$CONFIG"/yazi "$BACKUP"
cp -r "$CONFIG"/lazygit "$BACKUP"

# System Recreation
sudo cp "$NIXOS"/hardware-configuration.nix "$DOTFILES"/nixos/
sudo ln -sfnv "$DOTFILES"/nixos "$NIXOS"
sudo nixos-rebuild boot

# Removing .config
rm -rf "$DOTFILES"/nvim
rm -rf "$DOTFILES"/fastfetch
rm -rf "$DOTFILES"/hypr
rm -rf "$DOTFILES"/waybar
rm -rf "$DOTFILES"/wofi
rm -rf "$DOTFILES"/yazi
rm -rf "$DOTFILES"/lazygit

# Symlinks
ln -sfnv "$DOTFILES"/nvim "$CONFIG"
ln -sfnv "$DOTFILES"/fastfetch "$CONFIG"
ln -sfnv "$DOTFILES"/hypr "$CONFIG"
ln -sfnv "$DOTFILES"/waybar "$CONFIG"
ln -sfnv "$DOTFILES"/wofi "$CONFIG"
ln -sfnv "$DOTFILES"/yazi "$CONFIG"
ln -sfnv "$DOTFILES"/lazygit "$CONFIG"

# Reboot
reboot
