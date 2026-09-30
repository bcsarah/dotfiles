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

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Bluetooth
  hardware.bluetooth.enable = true;
}
