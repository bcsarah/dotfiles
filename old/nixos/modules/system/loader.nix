{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # ZRAM
  zramSwap.enable = true;

  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
