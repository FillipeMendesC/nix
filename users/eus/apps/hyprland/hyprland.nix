{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--user" ];

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      monitor = ",preferred,auto,1";

      bind = [
        # apps/session
        "$mod, Q, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, R, exec, $menu"
        "$mod SHIFT, M, exit"
        "$mod SHIFT, R, exec, hyprctl reload"

        # close/toggle
        "$mod SHIFT, C, killactive"
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"

        # focus move
        "$mod, l, movefocus, l"
        "$mod, h, movefocus, r"
        "$mod, j, movefocus, u"
        "$mod, k, movefocus, d"

        # workspace switch
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # scroll workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        #Audio mutar
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      binde = [
        #Audio aumentar e diminuir
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        #Tela aumentar e diminuir2
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      exec-once = [
        "mako"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init"
        "nm-applet --indicator"
      ];

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      input = {
        kb_layout = "br";
        kb_variant = "abnt2";
        kb_model = "";
        kb_rules = "";
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "~/nix/assets/wallhaven-3q5g5v_1920x1200.png" ];
      wallpaper = [
        "eDP-1,~/nix/assets/wallhaven-3q5g5v_1920x1200.png"
        "HDMI-A-1,~/nix/assets/wallhaven-3q5g5v_1920x1200.png"
      ];
    };
  };
}
