{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI
    tmux
    tree
    fzf
    bat
    glow
    md2pdf
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
    ani-cli
  ];
}

