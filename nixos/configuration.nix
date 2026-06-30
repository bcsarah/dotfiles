{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/loader.nix
    ./modules/locales.nix
    ./modules/shell.nix
    ./modules/users.nix
    ./modules/wm.nix
    ./modules/fonts.nix
  ];

  # Others
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  services.flatpak.enable = true;

  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  system.stateVersion = "26.05"; # Did you read the comment?
}
