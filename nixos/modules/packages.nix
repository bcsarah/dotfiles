{ config, pkgs, ... }:

{
  # Unfree Softwares
  nixpkgs.config.allowUnfree = true;

  # Enables
  programs.niri.enable = true;
  programs.neovim.enable = true;
  programs.vim.enable = true;
  programs.fish.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  programs.steam.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [

    # CLI
    tree-sitter
    eslint_d
    wget
    git
    tree
    ripgrep
    fzf
    fd
    bat
    glow
    fend
    ncdu
    tmux
    unzip

    lazygit
    btop
    yazi
    cmus

    fastfetch
    cmatrix
    asciiquarium
    vitetris


    # Coding
    python3
    pipx
    nodejs
    openjdk21
    maven
    clang-tools
    gcc
    gnumake


    # GUI
    firefox
    libreoffice
    obsidian
    localsend
    syncthing
    mpv
    osu-lazer-bin


    # Niri
    kitty
    noctalia
    thunar
    wl-clipboard
    brightnessctl
    xwayland-satellite


    # Icons
    papirus-icon-theme
    google-cursor

    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    adw-gtk3
    adwaita-qt
    adwaita-qt6
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    corefonts
  ];
}
