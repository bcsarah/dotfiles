{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/loader.nix
    ./modules/locales.nix
    ./modules/users.nix
    ./modules/packages.nix
  ];

  # Others
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; # Did you read the comment?
}
