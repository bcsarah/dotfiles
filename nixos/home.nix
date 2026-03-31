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
    iconTheme.name = "Papirus-dark";
    cursorTheme.name = "GoogleDot-Black";
  };


  # Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_prompt
      # Quebra de linha antes do prompt
      echo

      # Usuário
      set_color brgreen
      echo -n (whoami)

      # Separador
      set_color brblack
      echo -n "@"

      # Host
      set_color brblue
      echo -n (hostname)

      # Texto "in"
      set_color brblack
      echo -n " in "

      # Diretório
      set_color yellow
      echo -n (prompt_pwd)

      # Git branch
      if git rev-parse --is-inside-work-tree >/dev/null 2>&1
          set branch (git branch --show-current)
          if not git diff --quiet --ignore-submodules
              set_color red
              set git_icon "✗"
          else
              set_color brpurple
              set git_icon "✔"
          end
          echo -n " ("$branch" "$git_icon")"
      end

      # Quebra de linha antes do símbolo do prompt
      echo

      # Símbolo do prompt
      set_color red
      echo -n "❯ "
      set_color normal
      end
    '';
    shellAliases = {};
  };


  # Git
  programs.git = {
    enable = true;
    settings.user = {
      name = "Better Call Sarah";
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
    nodePackages.nodejs
    prettier
    eslint
    jdk17
    jdt-language-server
    ruby
    
    # GUI
    firefox
    discord
    spotify
    zapzap
    pavucontrol
    github-desktop

    # Audio Visual
    onlyoffice-desktopeditors
    krita

    # Games
    steam

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
  home.file.".local/share/applications/blueman-manager.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
}
