{ pkgs, ... }: {

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d --max-freed 1G"; 
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git
      curl
      docker-compose
    ];
  };

  nixpkgs.config.allowUnfree = true;
}