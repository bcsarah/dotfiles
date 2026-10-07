{ config, pkgs, ... }:

{
  # Enables
  programs.niri.enable = true;
  programs.neovim.enable = true;
  programs.vim.enable = true;
  programs.fish.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;

  services.displayManager.ly.enable = true;

  services.xserver.windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
          src = ../../wm/dwm/;
      }
  }

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };

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
    noctalia
    wl-clipboard
    brightnessctl

    # DWM
    dmenu
    feh
    xclip
    pavucontrol


    # Icons
    papirus-icon-theme
    google-cursor

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
