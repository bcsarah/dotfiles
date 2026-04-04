{ config, pkgs, inputs, ... }:

{
  # Usuário
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "26.05";


  # Fish
  programs.fish = {
    enable = true;
    shellInit = ''
      clear
      fastfetch
    '';
    interactiveShellInit = ''
      function fish_prompt
        echo
        set_color yellow
        echo -n (prompt_pwd)

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

        set_color red
        echo -n " ❯ "

        set_color normal
      end
    '';
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
    wget
    zip
    unzip
    unrar
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
    nodejs
    openjdk21
    ruby
    
    # GUI
    firefox
    discord
    spotify
    zapzap
    pavucontrol
    nautilus

    # Audio Visual
    onlyoffice-desktopeditors
    krita

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

    # Better CLI
    fastfetch
    sl
    cmatrix
    asciiquarium
    pipes
    cava
    cowsay

    # Others
    papirus-icon-theme
    google-cursor
    nwg-look

  ];


  # Hide desktop icons
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
  home.file.".local/share/applications/nwg-look.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
}
