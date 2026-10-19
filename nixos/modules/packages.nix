{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    # Enables
    programs.neovim.enable = true;
    programs.vim.enable = true;
    programs.fish.enable = true;
    services.gvfs.enable = true;
    programs.steam.enable = true;
    services.flatpak.enable = true;

    # XDG Portal
    xdg.portal = {
        enable = true;
        config.common.default = "gtk";
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };

    # Steam config
    nixpkgs.overlays = [
        (final: prev: {
            steam = prev.steam.override {
                extraArgs = "-cef-disable-gpu-compositing";
            };
        })
    ];


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
        tree
        ripgrep
        fzf
        fend
        ncdu
        tmux
        zip
        unzip
        unrar
        kid3
        eyed3
        tree-sitter
        eslint_d

        lazygit
        htop
        ranger
        cmus
        bluetui

        fastfetch
        cmatrix
        asciiquarium


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
        mpv
        localsend
        syncthing
        osu-lazer-bin
        netbeans


        # i3wm
        kitty
        rofi
        polybar
        picom
        dunst
        thunar
        pavucontrol

        autotiling
        i3lock
        xautolock
        feh
        maim
        xclip
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
