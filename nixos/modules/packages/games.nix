{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  home.packages = with pkgs {
    steam
    lutris
    wine
    flatpak
  };
}
