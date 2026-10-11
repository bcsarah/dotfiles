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
        zip
        unzip
        rar
        unrar
        wine64

        lazygit
        btop
        ranger
        cmus
        bluetui
        youtube-tui

        fastfetch
        cmatrix
        asciiquarium
        vitetris
        chess-tui


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


        # i3wm
        kitty
        rofi
        polybar
        picom
        dunst
        thunar
        pavucontrol

        i3lock
        xautolock
        feh
        maim
        xclip
        haskellPackages.greenclip
        autotiling
        playerctl
        redshift
        brightnessctl


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
