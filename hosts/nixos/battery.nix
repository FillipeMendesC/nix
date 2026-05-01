{ ... }:
{
  services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;

  boot.kernelParams = [ "asus_nb_wmi.charge_control_end_threshold=80" ];
}
