{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];
    timeServers = [ "0.br.pool.ntp.org" ];
  };

  hardware.bluetooth.enable = true;
}
