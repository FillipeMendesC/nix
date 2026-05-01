{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--user" ];

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "kitty yazi";
      "$menu" = "wofi --show drun";
      "$scripts" = "$HOME/.config/hypr/scripts";

      monitor = ",preferred,auto,1";

      dwindle = {
        preserve_split = true;
        smart_split = false;
        smart_resizing = true;
      };

      bind = [
        # apps/session
        "$mod, Q, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, W, exec, zen-beta"
        "$mod, r, exec, $menu"
        
        "$mod, Escape, exec, wlogout"
        "$mod, p, exec, nwg-displays"
        ", XF86TouchpadToggle, exec, $scripts/toggle-touchpad.sh"
        
        # close/toggle
        "$mod SHIFT, C, killactive"
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"

        # focus move
        "$mod, l, movefocus, r"
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, u"
        "$mod, k, movefocus, d"

        # move windows
        "$mod Shift, left, movewindow, l"
        "$mod Shift, right, movewindow, r"
        "$mod Shift, up, movewindow, u"
        "$mod Shift, down, movewindow, d"

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

        # screenshot
        "$mod SHIFT, S, exec, grimblast --notify copy area"

        # Window Grouping (Tabs)
        "$mod, G, togglegroup"
        "$mod, TAB, changegroupactive, f"
        "$mod SHIFT, TAB, changegroupactive, b"

        # Special Workspace (Scratchpad)sss5
        "$mod, S, togglespecialworkspace, magic"
        "$mod ALT, S, movetoworkspace, special:magic"

        # Window State Management
        "$mod, P, pin"                 # Pin window to all workspaces
        "$mod, C, centerwindow"        # Centers floating window
        # Set active window to 100% opacity (Opaque)
        "$mod, O, setprop, active, opacity 1.0"
        # Set active window to 80% opacity (Transparent)
        "$mod SHIFT, O, setprop, active, opacity 0.8"
        
        # Swapping windows (Internal logic of dwindle)
        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"
      ];

      bindl = [
        #Audio mutar
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      binde = [
        #Audio aumentar e diminuir
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

        #Tela aumentar e diminuir2
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        # resize windows
        "$mod, Minus, resizeactive, -10% 0 # Resize left"
        "$mod, Equal, resizeactive, 10% 0 # Resize right"
        "$mod Shift, Minus, resizeactive, 0 -10% # Resize up"
        "$mod Shift, Equal, resizeactive, 0 10% # Resize down"
      ];

        # Mouse bindings for moving and resizing windows
        bindm = [
          # Move window with $mod + left mouse button
          "$mod, mouse:272, movewindow"
          # Resize window with $mod + right mouse button
          "$mod, mouse:273, resizewindow"
        ];


      exec-once = [
        "mako"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init"
      ];

      gestures = {
          workspace_swipe_distance = 700;
          workspace_swipe_cancel_ratio = 0.15;
          workspace_swipe_min_speed_to_force = 5;
          workspace_swipe_direction_lock = true;
          workspace_swipe_direction_lock_threshold = 10;
          workspace_swipe_create_new = true;
      };

      windowrule = [
        "match:class ^(pavucontrol)$, float 1"
        "match:class ^(blueman-manager)$, float 1"
        
        # Opacity now requires explicit focus/initial values
        "match:class ^(kitty)$, opacity 0.9 0.8"

        # Floating and pinning for launchers
        "match:class ^(wofi)$, float 1"
        "match:class ^(wofi)$, pin 1"
        
        # Workspace assignment (Direct match)
        "match:class ^(zen-beta)$, workspace 3"
      ];

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "EGL_PLATFORM,wayland"
        "NIXOS_OZONE_WL,1"

        # XDG Specifications
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        # Toolkit Backend
        "GDK_BACKEND,wayland,x11,*" 
        "QT_QPA_PLATFORM,wayland;xcb"
        "SDL_VIDEODRIVER,wayland" 
        "CLUTTER_BACKEND,wayland"

        # Qt Variables 
        "QT_AUTO_SCREEN_SCALE_FACTOR,1" 
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"

        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      input = {
        kb_layout = "br";
        kb_variant = "abnt2";
        kb_model = "";
        kb_rules = "";
      };

    };
  };
}
