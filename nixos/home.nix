{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/nvim.nix
    ./modules/hide-desktop.nix
  ];
  
  # User
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "26.05";
}
