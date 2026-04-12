{ ... }: {
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true; # Fixed from systemManager
    xserver = {
      enable = true; 
      xkb = {
        layout = "br";
        variant = "nodeadkeys";
      };
    };
  };
}