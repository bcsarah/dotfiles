{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI
    bat
    glow
    md2pdf
    tree
    fzf
    wget
    zip
    unzip

    # Awesome
    fastfetch
    cmatrix
    asciiquarium

    # TUI
    btop
    bluetui
    youtube-tui
    spotify-player
  ];
}

