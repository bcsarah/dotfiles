{ config, pkgs, opencode, zen-browser, ... }:

{
  # Enables
  programs.niri.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.vim.enable = true;
  programs.fish.enable = true;
  services.gvfs.enable = true;

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
    tree
    ripgrep
    fzf
    fd
    bat
    fent
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


    # Coding
    python3
    nodejs
    openjdk21
    maven
    gcc
    gnumake


    # LazyVim
    tree-sitter
    eslint_d


    # GUI
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    libreoffice
    obsidian
    mpv


    # Niri
    kitty
    noctalia
    nautilus
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
