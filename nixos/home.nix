{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/config/nvim.nix
    ./modules/config/git.nix
    ./modules/config/yazi.nix
    ./modules/packages/packages.nix
  ];
  
  # User
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "25.11";
}
