{ pkgs, ... }:
{
  environment.sessionVariables = {
    EGL_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
    config.common.default = "*";
  };
}
