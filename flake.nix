{
  description = "My Home Manager configuration";

  inputs = {
    #nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;

      system = "x86_64-linux";

      pkgs = import nixpkgs {
	inherit system;
	config = { allowUnfree = true; };
      };

    in {
      homeConfigurations = {
        hurbeana = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
