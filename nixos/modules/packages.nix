{ config, pkgs, ... }:

{
  # Enables
  programs.niri.enable = true;
  programs.neovim.enable = true;
  programs.vim.enable = true;
  programs.fish.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  # QT_QPA_PLATFORMTHEME
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";

  # Unfree Softwares
  nixpkgs.config.allowUnfree = true;

  
  # Packages
  environment.systemPackages = with pkgs; [

    # CLI
    wget
    git
    tree
    ripgrep
    fzf
    fd
    bat
    fend
    tmux
    unzip

    lazygit
    ncdu
    btop
    yazi
    cmus

    fastfetch
    cmatrix
    asciiquarium
    vitetris
    tomato-c


    # Coding
    python3
    nodejs
    openjdk21
    maven
    clang-tools
    gcc
    gnumake

    # LazyVim
    tree-sitter
    eslint_d


    # GUI
    firefox
    libreoffice
    obsidian
    mpv


    # Niri
    kitty
    nautilus
    noctalia
    wl-clipboard
    brightnessctl


    # Icons
    papirus-icon-theme
    gruvbox-kvantum
    gruvbox-dark-gtk
    google-cursor
    nwg-look

    # Fonts
    noto-fonts-cjk-sans
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    texlivePackages.noto-emoji
    corefonts
  ];
}
