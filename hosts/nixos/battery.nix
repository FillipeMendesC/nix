{ ... }:
{
  services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;
  hardware.asus.battery = {
    chargeUpto = 80;
    enableChargeUptoScript = true;
  };
}
