{ pkgs, inputs, ... }:

{
  # Greeter
  services.displayManager.ly.enable = true;

  # Hyprland
  programs.hyprland.enable = true;
}
