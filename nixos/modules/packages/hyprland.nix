{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Hyprland
    kitty
    wofi
    waybar
    dunst
    grim
    slurp
    hyprsunset
    swaybg
    wl-clipboard
    brightnessctl
  ];
}
