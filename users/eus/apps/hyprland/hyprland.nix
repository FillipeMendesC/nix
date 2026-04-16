{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--user" ];

    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, M, exit"
        "$mod, E, exec, dolphin"
        "$mod, R, exec, wofi --show drun"
      ];

      exec-once = [
        "waybar"
        "mako"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "./assets/${./assets/wallhaven-xejzlz_1920x1200.png}" ];
      wallpaper = [ ",${./assets/wallhaven-xejzlz_1920x1200.png}" ];
    };
  };
}
