{ config, pkgs, ... }:

{
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  # Git
  programs.git = {
    enable = true;
    settings.user = {
      name = "Better Call Sarah";
      email = "bcsarah@proton.me";
    };
  };

  programs.lazygit.enable = true;


  # Nvim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };



  # Packages
  home.packages = with pkgs; [
    # CLI
    flatpak
    tmux
    tree
    fzf
    bat
    glow
    md2pdf
    zip
    unzip
    btop
    bluetui
    yazi

    fastfetch
    cmatrix
    asciiquarium


    # Coding
    python3
    openjdk21
    maven
    nodejs
    ruby

    # LazyVim
    tree-sitter
    prettierd
    eslint_d
    gnumake
    ripgrep
    stylua
    gcc
    fd


    # GUI
    firefox
    discord
    zapzap
    rhythmbox
    obsidian

    libreoffice
    krita
    mpv
    eog
    syncthing
    pavucontrol


    # Hyprland
    kitty
    wofi
    waybar
    dunst
    grim
    slurp
    hyprsunset
    swaybg
    thunar
    gvfs
    wl-clipboard
    brightnessctl


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
