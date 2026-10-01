{ config, pkgs, opencode, zen-browser, ... }:

{
  # Enables
  programs.niri.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
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
    tmux
    tree
    fzf
    fd
    bat
    ripgrep
    bc
    zip
    unzip

    lazygit
    ncdu
    btop
    yazi
    cmus

    opencode.packages.${pkgs.stdenv.hostPlatform.system}.default
    fastfetch
    cmatrix
    asciiquarium
    vitetris


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
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    obsidian
    libreoffice
    mpv


    # Niri
    kitty
    noctalia
    nautilus
    wl-clipboard
    brightnessctl


    # Icons
    papirus-icon-theme
    google-cursor
    gruvbox-kvantum
    gruvbox-dark-gtk
    nwg-look

    # Fonts
    noto-fonts-cjk-sans
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    texlivePackages.noto-emoji
  ];
}
