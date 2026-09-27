{ config, pkgs, ... }:

{
  # Enables
  programs.git.enable = true;
  programs.lazygit.enable = true;
  programs.neovim.enable = true;
  programs.niri.enable = true;
  services.gvfs.enable = true;

  # QT_QPA_PLATFORMTHEME
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";

  # Unfree Softwares
  nixpkgs.config.allowUnfree = true;

  
  # Packages
  environment.systemPackages = with pkgs; [

    # CLI
    tmux
    tree
    fzf
    fd
    bat
    ripgrep
    zip
    unzip

    ncdu
    btop
    yazi
    bluetui

    fastfetch
    cmatrix
    asciiquarium


    # Coding
    python3
    openjdk21
    maven
    nodejs
    gcc


    # LazyVim
    tree-sitter
    prettierd
    eslint_d
    stylua


    # GUI
    firefox
    obsidian
    libreoffice
    pavucontrol
    mpv
    eog

    vscode
    github-desktop


    # Niri
    kitty
    wofi
    waybar
    dunst
    swaybg
    thunar
    thunar-volman
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
