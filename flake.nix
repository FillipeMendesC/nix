{
  description = "My NixOS and Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; 
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }: 
  let
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
            ./hosts/nixos/configuration.nix
            inputs.home-manager.nixosModules.home-manager {
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users.eus = import ./modules/home-manager/home.nix;
            }
        ];
    };
  };
}