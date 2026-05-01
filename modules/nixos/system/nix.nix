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

      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
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
      nh
    ];
  };

  security.polkit.enable = true;

  programs.nix-ld.enable = true;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.config.allowUnfree = true;
}
