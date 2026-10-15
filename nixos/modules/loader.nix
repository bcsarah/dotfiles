{ config, pkgs, ... }:

{
    # Bootloader / Kernel
    boot.kernelPackages = pkgs.linuxPackages_zen;

    boot.loader = {
        efi.canTouchEfiVariables = true;

        grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
            # useOSProber = true;
            configurationLimit = 5;
        };
    };


    # Audio
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # jack.enable = true;
    };




    # Network
    networking.networkmanager.enable = true;
    networking.hostName = "nixos";
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 53317 ];
        allowedUDPPorts = [ 53317 ];
    };


    # Others
    nix.settings.warn-dirty = false;
    hardware.bluetooth.enable = true;
    services.power-profiles-daemon.enable = true;
    zramSwap.enable = true;

    services.udev.packages = with pkgs; [ game-devices-udev-rules ];
    hardware.uinput.enable = true;

    environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
}
