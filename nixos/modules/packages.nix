{ config, pkgs, ... }:

{
  # Enables
  services.displayManager.ly.enable = true;

  programs.git.enable = true;
  programs.lazygit.enable = true;
  programs.neovim.enable = true;
  programs.niri.enable = true;

  # QT_QPA_PLATFORMTHEME
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";

  
  # Packages
  environment.systemPackages = with pkgs; [
    # CLI
    tmux
    tree
    fzf
    fd
    bat
    btop
    ripgrep
    yazi
    zip
    unzip

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
    libreoffice
    pavucontrol
    mpv
    eog


    # Niri
    kitty
    wofi
    waybar
    dunst
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
