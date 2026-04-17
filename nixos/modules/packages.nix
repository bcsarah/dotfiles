{ config, pkgs, ... }:

{
  # Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Home Packages
  home.packages = with pkgs; [
    # CLI
    bat
    glow
    md2pdf
    tree
    fzf
    wget
    zip
    unzip
    btop
    fastfetch
    cmatrix
    asciiquarium

    # TUI
    yazi
    bluetui
    youtube-tui
    discordo
    nchat
    spotify-player
    
    # GUI
    qutebrowser
    discord
    syncthing
    pavucontrol

    # Audio Visual
    libreoffice
    krita
    mpv
    eog

    # Games
    steam
    lutris
    wine
    flatpak

    # Programming
    python3
    openjdk21
    maven
    nodejs
    ruby

    # Neovim
    tree-sitter
    prettierd
    eslint_d
    gnumake
    ripgrep
    stylua
    gcc
    fd

    # Hyprland
    kitty
    wofi
    waybar
    dunst
    grim
    slurp
    hyprsunset
    swaybg
    wl-clipboard
    brightnessctl

    # Niri
    allacritty
    fuzzel

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
