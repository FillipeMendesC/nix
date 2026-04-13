{ pkgs, inputs, ... }:
{

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    registry.nixpkgs.flake = inputs.nixpkgs;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git
      curl
      docker-compose
      pciutils
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
