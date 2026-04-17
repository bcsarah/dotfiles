{ pkgs, inputs, ... }:

{
  # Greeter
  services.displayManager.ly.enable = true;

  # Hyprland
  programs.hyprland.enable = true;
  
  # Niri
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.qs
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
