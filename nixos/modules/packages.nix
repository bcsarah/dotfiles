{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;


    # Enables
    programs.vim.enable = true;
    programs.zsh.enable = true;
    services.gvfs.enable = true;
    programs.steam.enable = true;


    # Display Manager / Window Manager
    services.displayManager.ly.enable = true;

    services.xserver = {
        enable = true;
        xkb = {
            layout = "br";
            variant = "abnt2";
        };

        windowManager.i3.enable = true;
    };


    # Packages
    environment.systemPackages = with pkgs; [

        # CLI
        wget
        git
        bat
        tree
        ripgrep
        fzf
        bc
        ncdu
        tmux
        zip
        unzip
        unrar
        lm_sensors
        trash-cli

        lazygit
        htop
        ranger
        cmus
        bluetui

        fastfetch
        cmatrix
        asciiquarium


        # Coding
        nodejs
        openjdk21
        maven
        gcc
        gnumake


        # GUI
        firefox
        libreoffice
        obsidian
        mpv
        imv
        syncthing
        netbeans


        # i3wm
        kitty
        dmenu
        picom
        dunst
        thunar
        pavucontrol

        autotiling
        i3lock
        xautolock
        xwallpaper
        xclip
        maim
        redshift
        brightnessctl


        # Icons
        papirus-icon-theme
        google-cursor

        nwg-look
        libsForQt5.qt5ct
        kdePackages.qt6ct
        adw-gtk3
    ];

    # Fonts
    fonts.packages = with pkgs; [
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono
        noto-fonts-color-emoji
        corefonts
    ];
}
