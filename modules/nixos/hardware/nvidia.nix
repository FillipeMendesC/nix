{ ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      powerManagement = {
        enable = true;
      };
      #prime = {
      #  intelBusId = "PCI:0@0:2:0";
      #  nvidiaBusId = "PCI:1@0:0:0";
      #};
      #primeBatterySaverSpecialisation = true;
    };
    nvidia-container-toolkit.enable = true;
  };
}
