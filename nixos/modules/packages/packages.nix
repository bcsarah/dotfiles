
{ config, pkgs, ... }:

{
  imports = [
    ./games.nix
    ./cli.nix
    ./code.nix
    ./gui.nix
    ./hyprland.nix
    ./icons.nix
  ];
}
