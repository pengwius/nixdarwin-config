{
  description = "pengwius nix-darwin config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }: {
    darwinConfigurations = {
	  "eugemachine" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ 
          ./configuration.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."pengwius" = import ./home.nix;
          }
        ];
      };
    };
  };
}

