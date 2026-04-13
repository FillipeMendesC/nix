{ ... }:
{
  environment.sessionVariables = {
    EGL_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}
