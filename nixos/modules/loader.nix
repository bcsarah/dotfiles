{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 5;
    };
  };


  # Kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # ZRAM
  zramSwap.enable = true;

  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Bluetooth
  hardware.bluetooth.enable = true;
}
