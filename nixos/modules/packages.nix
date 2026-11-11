{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;


    # Enables
    programs.neovim.enable = true;
    programs.zsh.enable = true;
    services.gvfs.enable = true;


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
        ncdu
        tmux
        zip
        unzip

        fastfetch
        htop
        ranger
        cmus


        # Coding
        gcc
        gnumake


        # GUI
        firefox
        mpv
        imv
        osu-lazer-bin


        # i3wm
        kitty
        thunar
        dmenu
        picom
        dunst
        pavucontrol

        i3lock
        xwallpaper
        xclip
        maim
        redshift
        brightnessctl


        # Icons
        papirus-icon-theme
        adw-gtk3
        nwg-look
    ];

    # Fonts
    fonts.packages = with pkgs; [
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono
        noto-fonts-color-emoji
    ];
}
