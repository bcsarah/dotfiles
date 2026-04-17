{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
     quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, noctalia, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        home-manager.nixosModules.home-manager
        ./configuration.nix
        {
          home-manager.extraSpecialArgs = { inherit inputs ; };
          home-manager.users.bcsarah = import ./home.nix;
        }
      ];
    };
  };
}
