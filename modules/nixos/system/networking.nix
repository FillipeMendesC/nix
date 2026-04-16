{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
