{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 8;

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
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            urgent = "";
          };
        };

        "hyprland/window" = {
          max-length = 60;
          separate-outputs = true;
        };

        clock = {
          format = "  {:%H:%M}";
          tooltip-format = "<big>{:%A, %d %B %Y}</big>";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "  muted";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
          scroll-step = 5;
          on-click = "pavucontrol";
        };

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };

        network = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "󰈀  {ipaddr}";
          format-disconnected = "󰖪  offline";
          tooltip-format = "{ifname} • {ipaddr}/{cidr}";
        };

        battery = {
          interval = 10;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
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
      }

      window#waybar {
        background: rgba(17, 17, 27, 0.90);
        color: #cdd6f4;
      }

      #workspaces button {
        color: #a6adc8;
        padding: 0 8px;
        border: none;
        background: transparent;
      }

      #workspaces button.active {
        color: #89b4fa;
      }

      #workspaces button.urgent {
        color: #f38ba8;
      }

      #window {
        color: #cdd6f4;
      }

      #clock, #pulseaudio, #backlight, #network, #battery, #cpu, #me2mory, #tray, #custom-power {
        padding: 0 10px;
        margin: 4px 0;
      }

      #clock { color: #f9e2af; }
      #pulseaudio { color: #89b4fa; }
      #backlight { color: #f9e2af; }
      #network { color: #94e2d5; }
      #battery { color: #a6e3a1; }
      #cpu { color: #fab387; }
      #memory { color: #cba6f7; }
      #custom-power { color: #f38ba8; }
    '';
  };
}
