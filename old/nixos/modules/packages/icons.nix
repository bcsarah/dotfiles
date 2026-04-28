{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Icons
    papirus-icon-theme
    google-cursor
    adwaita-qt
    adwaita-qt6

    gruvbox-kvantum
    gruvbox-dark-gtk

    nwg-look
    kdePackages.qt6ct
    libsForQt5.qt5ct
  ];
}
