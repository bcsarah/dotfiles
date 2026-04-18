{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    qutebrowser
    discord
    syncthing
    pavucontrol

    # Audio-Visual
    onlyoffice-desktopeditors
    krita
    mpv
    eog
  ];
}
