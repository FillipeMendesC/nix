{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  hardware.bluetooth.enable = true;

  networking.timeServers = [ "0.br.pool.ntp.org" ];
}
