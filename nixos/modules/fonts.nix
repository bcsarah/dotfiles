{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    noto-fonts-cjk-sans
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    texlivePackages.noto-emoji
  ];
}
