{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # ZRAM
  zramSwap.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Locales
  time.timeZone = "America/Maceio";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Greeter
  services.displayManager.ly.enable = true;
  
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Users
  users.users.bcsarah = {	# i :3
    isNormalUser = true;
    description = "Better Call Sarah";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  users.defaultUserShell = pkgs.fish;

  # Shell
  programs.fish.enable = true;
  
  # Hyprland
  programs.hyprland.enable = true;

  # Unfree
  nixpkgs.config.allowUnfree = true;

  # Steam
  programs.steam = {
    enable = true;
  };

  # Flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "io.mrarm.mcpelauncher"
      "com.mojang.Minecraft"
      "sh.ppy.osu"
    ];
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    noto-fonts-cjk-sans
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    texlivePackages.noto-emoji
  ];

  # End of the File :3
  system.stateVersion = "25.11"; # Did you read the comment?
}
