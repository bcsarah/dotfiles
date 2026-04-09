{ config, pkgs, inputs, ... }:

{
  # Usuário
  home.username = "bcsarah";
  home.homeDirectory = "/home/bcsarah";
  home.stateVersion = "26.05";


  # Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
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


  # Firefox
  programs.firefox = {
    enable = true;
  };


  # Unfree Software
  nixpkgs.config.allowUnfree = true;

  # Home Packages
  home.packages = with pkgs; [
    # CLI
    wget
    zip
    unzip
    btop
    tree
    bluetui
    fastfetch
    cmatrix
    asciiquarium
    
    # GUI
    nautilus
    discord
    spotify
    obsidian
    pavucontrol

    # Audio Visual
    onlyoffice-desktopeditors
    krita
    kdePackages.kdenlive
    obs-studio

    # Programming
    python3
    nodejs
    ruby
    openjdk21
    maven

    # Neovim
    tree-sitter
    prettierd
    eslint_d
    gnumake
    ripgrep
    stylua
    gcc
    fzf
    fd

    # Hyprland
    kitty
    wofi
    waybar
    grim
    slurp
    swaybg
    hyprsunset
    brightnessctl
    wl-clipboard

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
}
