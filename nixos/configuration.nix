{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;


  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.

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


  # Users
  users.users.bcsarah = {	# i :3
    isNormalUser = true;
    description = "Better Call Sarah";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;	# Change Shell
  };
  users.defaultUserShell = pkgs.fish;

  # Shell
  programs.fish.enable = true;
  
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  
  # Unfree
  nixpkgs.config.allowUnfree = true;
  
  # Hyprland
  programs.hyprland.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [ ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];


  # End of the File :3
  system.stateVersion = "25.11"; # Did you read the comment?

}


