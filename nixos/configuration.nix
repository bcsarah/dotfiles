{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/loader.nix
    ./modules/system/locales.nix
    ./modules/system/shell.nix
    ./modules/system/users.nix
    ./modules/system/wm.nix
    ./modules/system/fonts.nix
  ];

  # Others
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11"; # Did you read the comment?

}
