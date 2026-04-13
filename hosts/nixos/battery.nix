{ ... }:
{
  #bypass no do kde que NÃO FUNCIONA POR ALGUM MOTIVO

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      RUNTIME_PM_BLACKLIST = "01:00.0";

      START_CHARGE_THRESH_BAT1 = 75;
      STOP_CHARGE_THRESH_BAT1 = 80;

      # Conectado
      RUNTIME_PM_ON_AC = "auto";

      PCIE_ASPM_ON_AC = "default";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # Na bateria:
      RUNTIME_PM_ON_BAT = "auto";

      PCIE_ASPM_ON_BAT = "powersave";

      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    };
  };
}
