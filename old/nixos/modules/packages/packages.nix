
{ config, pkgs, ... }:

{
  imports = [
    ./cli.nix
    ./gui.nix
    ./code.nix
    ./hyprland.nix
    ./games.nix
    ./icons.nix
  ];
  
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;
}
