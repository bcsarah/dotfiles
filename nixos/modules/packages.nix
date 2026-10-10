{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;


    # Enables
    programs.neovim.enable = true;
    programs.vim.enable = true;
    programs.fish.enable = true;
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
        displayManager.lightdm.enable = false;
        desktopManager.xterm.enable = false;
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
        unzip

        lazygit
        btop
        yazi
        cmus

        fastfetch
        cmatrix
        asciiquarium
        vitetris


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
        dmenu
        thunar
        polybar
        picom
        i3lock
        feh
        xclip
        autotiling
        brightnessctl
        pavucontrol


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
