{ pkgs, ... }:
{
  security.pam.services = {
    greetd.kwallet = {
      enable = true;
      package = pkgs.kdePackages.kwallet-pam;
    };
  };
}
