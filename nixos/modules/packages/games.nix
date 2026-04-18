{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Games
    steam
    lutris
    wine
    flatpak
  ];
}
