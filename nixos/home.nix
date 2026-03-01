{ config, pkgs, inputs, ... }:

{
  # Usuário
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "26.05";

  # Home-Manager
  programs.home-manager.enable = true;


  # GTK
  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
    iconTheme.name = "Papirus-dark";
    cursorTheme.name = "GoogleDot-Black";
  };

  # QT
  qt = {
    enable = true;  
    platformTheme.name = "gtk3";
  };


  # Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting ""

      function fish_prompt
        set_color brred
        echo -n (whoami)
        set_color white
        echo -n "@"
        set_color red
        echo -n (hostname)" "

        set_color white
        echo (prompt_pwd)
        set_color brblack
        echo -n "-❯ "

        set_color normal
      end

      function fish_postexec --on-event fish_postexec
        echo
      end
    '';
    shellAliases = {};
  };


  # Git
  programs.git = {
    enable = true;
    settings.user = {
      name = "Sarah Aurora";
      email = "sarahalencar6409@gmail.com";
    };
  };

  # LazyGit
  programs.lazygit.enable = true;


  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    withPython3 = true;
    withRuby = true;
    withNodeJs = true;
  };


  # Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Pacotes do usuário
  home.packages = with pkgs; [
    
    # CLI
    wget
    zip
    unzip
    btop
    bluetui
    tmux
    ncdu
    tree
    yazi

    # Neovim Dependencies
    gcc
    gnumake
    ripgrep
    fd
    fzf
    tree-sitter
    stylua
    prettierd
    eslint_d

    # Programming
    python3
    python3Packages.pip
    python3Packages.virtualenv
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    jdk17
    jdt-language-server
    
    # GUI
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    discord
    spotify
    zapzap
    pavucontrol

    # Audio Visual
    onlyoffice-desktopeditors
    krita
    obs-studio
    kdePackages.kdenlive

    # Games
    steam
    lutris
    wineWow64Packages.stable

    # Hyprland utilities
    kitty
    wofi
    waybar
    grim
    slurp
    swaybg
    hyprsunset
    brightnessctl
    wl-clipboard

    # CLI divertido
    fastfetch
    sl
    cmatrix
    asciiquarium
    pipes
    cava
    cowsay

    # Outros
    papirus-icon-theme
    google-cursor
    nwg-look
    adwaita-qt
    adwaita-qt6
    kdePackages.qt6ct
    libsForQt5.qt5ct

  ];

  home.file.".local/share/applications/nvim.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/btop.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/yazi.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/qt6ct.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/qt5ct.desktop".text = ''
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
}
