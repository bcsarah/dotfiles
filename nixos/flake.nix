{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    opencode.url = "github:dan-online/opencode-nix";
  };

  outputs = { self, nixpkgs, zen-browser, opencode, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
        ];
        specialArgs = { inherit zen-browser opencode; };
      };
    };
}
