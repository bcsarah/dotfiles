{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Coding
    python3
    openjdk21
    maven
    nodejs
    ruby

    # LazyVim
    tree-sitter
    prettierd
    eslint_d
    gnumake
    ripgrep
    stylua
    gcc
    fd
  ];
}
