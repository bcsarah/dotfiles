{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    firefox
    nautilus
    obsidian
    syncthing
    pavucontrol

    # Audio-Visual
    onlyoffice-desktopeditors
    krita
    mpv
    eog
  ];
}
