{ pkgs, ... }:
{
  environment.sessionVariables = {
    EGL_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  services.displayManager.sddm = {
    #enable = true;
    wayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
