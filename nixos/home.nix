{ config, pkgs, inputs, ... }:

{
  # Usuário
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "26.05";


  # Fish
  programs.fish = {
    enable = true;
    shellAliases = {};
  };


  # Git / Lazygit
  programs.git = {
    enable = true;
    settings.user = {
      name = "Better Call Sarah";
      email = "sarahalencar6409@gmail.com";
    };
  };
  programs.lazygit.enable = true;


  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    withPython3 = true;
    withNodeJs = true;
    withRuby = true;
  };


  # Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Home Packages
  home.packages = with pkgs; [
    # CLI
    bat
    tree
    fzf
    yazi
    wget
    zip
    unzip
    btop
    bluetui
    fastfetch
    cmatrix
    asciiquarium
    
    # GUI
    qutebrowser
    discord
    spotify
    obsidian
    syncthing
    pavucontrol
    easyeffects

    # Audio Visual
    onlyoffice-desktopeditors
    krita
    mpv

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
    grim
    hyprsunset
    slurp
    swaybg
    wl-clipboard
    brightnessctl

    # Icons
    papirus-icon-theme
    google-cursor
    nwg-look
  ];


  # Hide .desktop
  home.file.".local/share/applications/nvim.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/btop.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/nwg-look.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/blueman-manager.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/yazi.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
}
