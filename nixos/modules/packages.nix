{ config, pkgs, ... }:

{
  # Enables
  programs.niri.enable = true;
  programs.fish.enable = true;
  services.gvfs.enable = true;

  # QT_QPA_PLATFORMTHEME
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";

  # Unfree Softwares
  nixpkgs.config.allowUnfree = true;

  
  # Packages
  environment.systemPackages = with pkgs; [

    # CLI
    wget
    git
    tmux
    tree
    fzf
    fd
    bat
    ripgrep
    bc
    zip
    unzip

    neovim
    vim
    lazygit
    ncdu
    btop
    yazi
    ranger
    cmus
    bluetui

    fastfetch
    cmatrix
    asciiquarium


    # Coding
    python3
    openjdk21
    maven
    nodejs
    ruby
    clang-tools
    gcc
    gnumake


    # LazyVim
    tree-sitter
    prettierd
    eslint_d
    stylua


    # GUI
    firefox
    obsidian
    localsend
    syncthing
    libreoffice
    pavucontrol
    mpv
    eog

    vscode
    github-desktop
    netbeans


    # Niri
    kitty
    wofi
    waybar
    dunst
    swaybg
    thunar
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

    # Fonts
    noto-fonts-cjk-sans
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    texlivePackages.noto-emoji
  ];
}
