{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/loader.nix
    ./modules/locales.nix
    ./modules/users.nix
    ./modules/shell.nix
    ./modules/wm.nix
    ./modules/fonts.nix
  ];

  # Others
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11"; # Did you read the comment?
}
