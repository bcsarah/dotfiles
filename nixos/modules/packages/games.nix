{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Games
    lutris
    wine
    flatpak
  ];
}
