{
  description = "My NixOS and Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-jetbrains-plugins.url = "github:nix-community/nix-jetbrains-plugins";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    milk-grub-theme.url = "github:gemakfy/MilkGrub";
    stylix.url = "github:nix-community/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      username = "eus";
      hostname = "nixos";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username hostname; };
        modules = [
          inputs.stylix.nixosModules.stylix
          ./hosts/${hostname}/default.nix

          inputs.milk-grub-theme.nixosModule

          inputs.nixos-hardware.nixosModules.common-cpu-intel
          inputs.nixos-hardware.nixosModules.common-pc-ssd

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs username hostname; };
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      };
    };
}
