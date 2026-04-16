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
        function fish_greeting
        end

        function fish_prompt
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
    shellAliases = {
        img = "kitty +kitten icat";
    };
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
  };

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
  home.file.".local/share/applications/qt5ct.desktop".text = ''
  [Desktop Entry]
  Hidden=true
  '';
  home.file.".local/share/applications/qt6ct.desktop".text = ''
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
