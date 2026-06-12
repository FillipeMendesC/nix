{ ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  #services.displayManager.sddm.enable = true;
}
