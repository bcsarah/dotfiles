{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/packages.nix
  ];
  
  # User
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "25.11";
}
