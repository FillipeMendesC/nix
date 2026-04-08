{ pkgs, lib, ... }:

{
  #bypass no do kde que NÃO FUNCIONA POR ALGUM MOTIVO

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT1 = 75;
      STOP_CHARGE_THRESH_BAT1 = 80;

      # Conectado
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # Na bateria:
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    };
};
}