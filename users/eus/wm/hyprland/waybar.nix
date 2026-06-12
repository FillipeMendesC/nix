{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 40;
        spacing = 6;

        margin-top = 6;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "cpu"
          "memory"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          format = "{icon} ";
          persistent-workspaces = {
            "*" = 6;
          };
          format-icons = {
            active  = "●";
            default = "○";
            urgent  = "◉";
          };
        };

        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };

        clock = {
          format = " {:%H:%M}";
          tooltip-format = "<big>{:%A, %d %B %Y}</big>";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "  muted";
          format-icons.default = [ "" "" "" ];
          scroll-step = 5;
          on-click = "pavucontrol";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
        };

        network = {
          format-wifi = "󰖩  {essid} ({signalStrength}%)";
          format-ethernet = "󰈀  {ipaddr}";
          format-disconnected = "󰖪  offline";
          tooltip-format = "{ifname} • {ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        battery = {
          interval = 10;
          states = { warning = 30; critical = 15; };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged  = " {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        cpu = {
          format = "  {usage}%";
          interval = 5;
        };

        memory = {
          format = "  {}%";
          interval = 5;
        };

        tray = {
          spacing = 8;
        };

        "custom/power" = {
          format = "⏻";
          on-click = "wlogout";
          tooltip = false;
        };
      }
    ];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif;
        font-size: 13px;
        min-height: 0;
        border: none;
        border-radius: 0;
      }

      /* The bar itself: black, pill-shaped via border-radius */
      window#waybar {
        background: none;
        color: #cdd6f4;
        border-radius: 12px;
      }

      /* Each section (left/center/right) gets its own island feel */
      .modules-left,
      .modules-center,
      .modules-right {
        background: #111111;
        border-radius: 10px;
        padding: 0 6px;
        margin: 4px 4px;
      }

      /* Workspace buttons */
      #workspaces {
        padding: 0 4px;
      }

      #workspaces button {
        color: #555577;
        padding: 0 6px;
        background: transparent;
        transition: color 0.2s;
      }

      #workspaces button label {
        font-size: 12px;
      }

      #workspaces button.active {
        color: #89b4fa;
      }

      #workspaces button.urgent {
        color: #f38ba8;
      }

      /* All right-side modules share the same pill padding */
      #clock,
      #pulseaudio,
      #backlight,
      #network,
      #battery,
      #cpu,
      #memory,
      #tray,
      #custom-power {
        padding: 0 10px;
        color: #cdd6f4;
      }

      #window {
        color: #888899;
        padding: 0 8px;
        font-style: italic;
      }

      /* Individual accent colors */
      #clock        { color: #f9e2af; }
      #pulseaudio   { color: #89b4fa; }
      #backlight    { color: #f9e2af; }
      #network      { color: #94e2d5; }
      #battery      { color: #a6e3a1; }
      #cpu          { color: #fab387; }
      #memory       { color: #cba6f7; }
      #custom-power { color: #f38ba8; }
    '';
  };
}