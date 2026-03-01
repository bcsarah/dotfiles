#!/usr/bin/env bash
set -e

# Variáveis
DOTFILES=$HOME/dotfiles
CONFIG=$HOME/.config
NIXOS=/etc/nixos
BACKUP="$DOTFILES"/backup

# Backup
backup() {
  mkdir -p "$BACKUP"
  sudo cp -r "$NIXOS" "$BACKUP"
  for dir in nvim fastfetch hypr waybar wofi yazi lazygit; do
    [ -d "$CONFIG/$dir" ] && cp -r "$CONFIG/$dir" "$BACKUP"
  done
}

# Nixos
nixos() {
  rm -rf "$DOTFILES"/nixos/hardware-configuration.nix
  sudo mv "$NIXOS"/hardware-configuration.nix "$DOTFILES"/nixos

  sudo rm -rf "$NIXOS"
  sudo ln -sfnv "$DOTFILES"/nixos /etc
  sudo nixos-rebuild switch
}

# Config
config() {
  mkdir -p "$CONFIG"
  for dir in nvim fastfetch hypr waybar wofi yazi lazygit; do
    rm -rf "$CONFIG/$dir"
    ln -sfnv "$DOTFILES/$dir" "$CONFIG/$dir"
  done
}

# Main
main() {
  backup
  nixos
  config
}

main
