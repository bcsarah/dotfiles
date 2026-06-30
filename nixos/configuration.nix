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

  system.stateVersion = "26.05"; # Did you read the comment?
}
